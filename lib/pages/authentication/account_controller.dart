import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/enums.dart';
import '../../utils/navigation.dart';
import 'pages/forgot_password.dart';
import 'pages/login.dart';
import 'pages/sign_up.dart';
import 'pages/terms_and_data_policy.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) =>
    json.encode(data.toJson());

String accountTypeToString(AccountType accountType) {
  String accountTypeString =
      accountType.toString().split('.').last;
  return accountTypeString.substring(0, 1).toUpperCase() +
      accountTypeString.substring(1);
}

AccountType accountTypeFromString(
  String accountTypeString,
) {
  String formattedAccountTypeString =
      accountTypeString.toLowerCase();

  return AccountType.values.firstWhere(
    (element) =>
        element.toString().split('.').last ==
        formattedAccountTypeString,
  );
}

class UserModel {
  UserModel({
    this.name = '',
    this.id = '',
    this.accountType = AccountType.none,
    this.verified = false,
    this.email = '',
    this.imageUrl = '',
    this.walletAddress = '',
    this.token = 0,
    this.votes = 0,
    this.about = '',
    this.nationality = '',
  });

  String name;
  String id;
  AccountType accountType;
  bool verified;
  String email;
  String imageUrl;
  String walletAddress;
  int token;
  int votes;
  String about;
  String nationality;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(
        name: json['name'],
        id: json['id'],
        accountType: accountTypeFromString(
          json['accountType'],
        ),
        verified: json['verified'],
        email: json['email'],
        imageUrl: json['imageUrl'],
        walletAddress: json['walletAddress'],
        token: json['token'],
        votes: json['votes'],
        about: json['about'],
        nationality: json['nationality'],
      );

  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'accountType': accountTypeToString(accountType),
    'verified': verified,
    'email': email,
    'imageUrl': imageUrl,
    'walletAddress': walletAddress,
    'token': token,
    'votes': votes,
    'about': about,
    'nationality': nationality,
  };
}

class AccountController extends GetxController {
  final Rx<UserModel> _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel userModel) => _user.value = userModel;

  void initializeUserStream() {
    if (FirebaseAuth.instance.currentUser == null) {
      Get.snackbar(
        'Error initializing failed',
        'Tried to initialize user without being signed in',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 4,
        margin: const EdgeInsets.all(0),
      );
      return;
    }

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .listen((
          DocumentSnapshot<Map<String, dynamic>>
          databaseField,
        ) {
          if (kDebugMode) {
            print(
              '\n------------ Database changes detected! ------------\n',
            );
          }
          mapDatabaseInformation(
            databaseField: databaseField,
          );
        });

    FirebaseAuth.instance.userChanges().listen((
      User? accountInformation,
    ) {
      if (kDebugMode) {
        print(
          '\n------------ Auth changes detected! ------------\n',
        );
      }
      mapAccountInformation(
        accountInformation: accountInformation!,
      );
    });
  }

  void mapDatabaseInformation({
    required DocumentSnapshot<Map<String, dynamic>>
    databaseField,
  }) {
    _user.value = UserModel(
      name: databaseField['name'] ?? '',
      id: databaseField['id'] ?? '',
      accountType: accountTypeFromString(
        databaseField['accountType'],
      ),
      verified: databaseField['verified'] ?? false,
      email: databaseField['email'] ?? '',
      imageUrl: databaseField['imageUrl'] ?? '',
      walletAddress: databaseField['walletAddress'] ?? '',
      token: databaseField['token'] ?? 0,
      votes: databaseField['votes'] ?? 0,
      about: databaseField['about'] ?? '',
      nationality: databaseField['nationality'] ?? '',
    );
  }

  void mapAccountInformation({
    required User accountInformation,
  }) {
    _user.value = UserModel(
      name: accountInformation.displayName ?? '',
      id: accountInformation.uid,
      email: accountInformation.email ?? '',
      imageUrl: accountInformation.photoURL ?? '',
    );
  }

  bool getIsLoggedIn() {
    return FirebaseAuth.instance.currentUser?.uid != null;
  }

  ///
  /// Authentication Navigation
  ///
  RxInt currentPageIndex = 0.obs;

  RxMap<AuthPage, Widget> authenticationPages =
      {
        AuthPage.login: const LoginPage(),
        AuthPage.signUp: const SignUpPage(),
        AuthPage.forgotPassword: const ForgotPasswordPage(),
        AuthPage.termsAndPolicy:
            const TermsAndDataPolicyPage(),
      }.obs;

  Widget getCurrentAuthenticationPage() {
    switch (currentPageIndex.value) {
      case 0:
        return authenticationPages[AuthPage.login]!;
      case 1:
        return authenticationPages[AuthPage.signUp]!;
      case 2:
        return authenticationPages[AuthPage
            .forgotPassword]!;
      case 3:
        return authenticationPages[AuthPage
            .termsAndPolicy]!;
      default:
        return authenticationPages[AuthPage.login]!;
    }
  }

  void setCurrentAuthenticationPage({
    required AuthPage authPage,
  }) {
    switch (authPage) {
      case AuthPage.login:
        currentPageIndex.value = 0;
        break;
      case AuthPage.signUp:
        currentPageIndex.value = 1;
        break;
      case AuthPage.forgotPassword:
        currentPageIndex.value = 2;
        break;
      case AuthPage.termsAndPolicy:
        currentPageIndex.value = 3;
        break;
      // default:
      //   currentPageIndex.value = 0;
      //   break;
    }
  }

  ///
  ///
  ///
  /// Login, SignUp, SignOut
  ///
  ///
  ///

  ///
  /// Account Login
  ///
  Future<void> accountLogin({
    required String username,
    required String password,
  }) async {
    await _handleAccountOperation(
      operationName: 'Login',
      successMessage: 'You have been signed in!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: username,
              password: password,
            );

        initializeUserStream();
        //TODO: When spamming Login or SignUp Button, the CircularProgressIndicator does not dissapear correctly
      },
    );
  }

  ///
  /// Account SignUp
  ///
  Future<void> accountSignUp({
    required String username,
    required String eMail,
    required String password,
    required String repeatPassword,
    required AccountType accountType,
  }) async {
    await _handleAccountOperation(
      operationName: 'Sign Up',
      successMessage:
          'A verification code was send to $eMail!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
              email: eMail,
              password: password,
            );
        await FirebaseAuth.instance.currentUser!
            .updateDisplayName(username);
        await FirebaseAuth.instance.currentUser!
            .sendEmailVerification();

        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
              'name': username,
              'id': FirebaseAuth.instance.currentUser!.uid,
              'accountType': accountTypeToString(
                accountType,
              ),
              'verified': false,
              'email': eMail,
              'emailVerified': false,
              'imageUrl': '',
              'walletAddress': '',
              'token': 0,
              'votes': 0,
              'about': '',
              'nationality': '',
            });
        initializeUserStream();

        //TODO: What if Account creation Succeeds, but not the name, and also not the deletion?
        // await FirebaseAuth.instance.currentUser!.delete();
      },
    );
  }

  ///
  /// Sign Out
  ///
  Future<void> signOut() async {
    await _handleAccountOperation(
      operationName: 'Logging out',
      successMessage: 'You have been signed out!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        //TODO: does maybe not update
        await FirebaseAuth.instance.signOut();
        Get.offAllNamed(RouteNavigation.home);
      },
    );
  }

  ///
  /// Change Username
  ///
  Future<void> updateUsername({
    required String newUsername,
  }) async {
    await _handleAccountOperation(
      operationName: 'Updating username',
      successMessage:
          'Your username changed to: $newUsername!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseAuth.instance.currentUser!
            .updateDisplayName(newUsername);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'name': newUsername});
      },
    );
  }

  ///
  /// Change Profile Photo
  ///

  // Future<void> uploadProfilePhoto({
  //   required XFile image,
  // }) async {
  //   await _handleAccountOperation(
  //     operationName: 'Changing profile photo',
  //     successMessage: 'Your profile photo has been updated!',
  //     closeOverlaysOnSuccess: true,
  //     authOperation: () async {
  //       String filePath = 'profile_pictures/${FirebaseAuth.instance.currentUser!.uid}/profile_picture.jpg';
  //       Reference storageReference = FirebaseStorage.instance.ref().child('images').child(filePath);

  //       final metadata = SettableMetadata(
  //         contentType: 'profile_picture/jpg',
  //         customMetadata: {'profile_pictures': image.path},
  //       );

  //       if (kDebugMode) {
  //         print('Uploading depending on if its web');
  //       }
  //       UploadTask uploadTask;
  //       if (kIsWeb) {
  //         uploadTask = storageReference.putData(await image.readAsBytes(), metadata);
  //       } else {
  //         //TODO: Check if this works on mobile
  //         uploadTask = storageReference.putFile(File(image.path), metadata);
  //       }

  //       await uploadTask;

  //       if (kDebugMode) {
  //         print('getDownloadURL');
  //       }
  //       final String imageUrl = await storageReference.getDownloadURL();

  //       await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).update({
  //         'imageUrl': imageUrl,
  //       });

  //       if (kDebugMode) {
  //         print('image URL: $imageUrl');
  //       }
  //       await FirebaseAuth.instance.currentUser!.updatePhotoURL(imageUrl);
  //     },
  //   );
  // }

  ///
  /// Change E-Mail
  ///
  Future<void> updateEmail({
    required String newEmail,
  }) async {
    await _handleAccountOperation(
      operationName: 'Updating E-Mail',
      successMessage:
          'Your E-Mail changed to: ${FirebaseAuth.instance.currentUser!.email}!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseAuth.instance.currentUser!
            .updateEmail(newEmail);
        await FirebaseAuth.instance.currentUser!
            .sendEmailVerification();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'email': newEmail});
      },
    );
  }

  ///
  /// Change E-Mail
  ///
  Future<void> updateAbout({required String about}) async {
    await _handleAccountOperation(
      operationName: 'Updating about text',
      successMessage:
          'Your profile description has been updated!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'about': about});
      },
    );
  }

  ///
  /// Change E-Mail
  ///
  Future<void> updateNationality({
    required String nationality,
  }) async {
    await _handleAccountOperation(
      operationName: 'Updating nationality',
      successMessage: 'Your nationality has been updated!',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'nationality': nationality});
      },
    );
  }

  ///
  /// Change E-Mail
  ///
  Future<void> resendEmailVerification() async {
    await _handleAccountOperation(
      operationName: 'Sending the verification E-Mail',
      successMessage:
          'Verification code has been send to: ${FirebaseAuth.instance.currentUser!.email}!',
      authOperation: () async {
        await FirebaseAuth.instance.currentUser!
            .sendEmailVerification();
      },
    );
  }

  // ///
  // /// Change Password
  // ///
  // Future<void> updatePassword({
  //   required String newPassword,
  // }) async {
  //   await handleAccountOperation(
  //     operationName: 'Updating password',
  //     successMessage: 'Your password has been updated!',
  //     authOperation: () async {
  //       await FirebaseAuth.instance.currentUser!.updatePassword(newPassword);
  //     },
  //   );
  // }

  ///
  /// Password reset
  ///
  Future<void> resetPassword({String? eMail}) async {
    await _handleAccountOperation(
      operationName: 'Sending password reset E-Mail',
      successMessage:
          'Link to reset your password was send to your E-Mail!',
      authOperation: () async {
        await FirebaseAuth.instance.sendPasswordResetEmail(
          email:
              eMail ??
              (FirebaseAuth.instance.currentUser!.email)!,
        );
      },
    );
  }

  ///
  /// Delete Profile Photo
  ///
  Future<void> deleteProfilePhoto() async {
    await _handleAccountOperation(
      operationName: 'Deleting profile photo',
      successMessage: 'Your profile photo was deleted!',
      customErrorMessage: 'Failed to delete profile photo',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        String filePath =
            'profile_pictures/${FirebaseAuth.instance.currentUser!.uid}/profile_picture.jpg';
        Reference storageReference = FirebaseStorage
            .instance
            .ref()
            .child('images')
            .child(filePath);
        await storageReference.delete();
        await FirebaseAuth.instance.currentUser!
            .updatePhotoURL('');
        await FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'imageUrl': ''});
      },
    );
  }

  ///
  /// Delete Account
  ///
  Future<void> deleteAccount() async {
    await _handleAccountOperation(
      operationName: 'Account deletion',
      successMessage: 'Your account was deleted!',
      customErrorMessage: 'Failed to delete account',
      closeOverlaysOnSuccess: true,
      authOperation: () async {
        String uid = FirebaseAuth.instance.currentUser!.uid;
        await FirebaseAuth.instance.currentUser!.delete();
        await FirebaseFirestore.instance
            .collection('users')
            .doc(uid)
            .delete();
        //TODO: Delete Storage Image
      },
    );
  }

  ///
  ///
  /// Authentication call template
  ///
  ///
  Future<void> _handleAccountOperation({
    required String operationName,
    String? successMessage,
    String? customErrorMessage,
    required Future<void> Function() authOperation,
    bool closeOverlaysOnFail = false,
    bool closeOverlaysOnSuccess = false,
  }) async {
    Get.dialog(
      const Center(child: CircularProgressIndicator()),
    );

    try {
      await authOperation();
    } catch (error) {
      (closeOverlaysOnFail && successMessage != null)
          ? Get.back(closeOverlays: true)
          : Get.back();
      Get.snackbar(
        '$operationName failed',
        customErrorMessage == null
            ? '$error'
            : '$customErrorMessage: $error',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 4,
        margin: const EdgeInsets.all(0),
      );
      if (kDebugMode) {
        String message =
            customErrorMessage == null
                ? '$error'
                : '$customErrorMessage: $error';
        print(
          'Snackbar dialog: $operationName has failed $message',
        );
      }

      return;
    }

    (closeOverlaysOnSuccess && successMessage != null)
        ? Get.back(closeOverlays: true)
        : Get.back();
    if (successMessage != null) {
      Get.snackbar(
        '$operationName was successful',
        successMessage,
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 4,
        margin: const EdgeInsets.all(0),
      );
    }
    if (kDebugMode) {
      print(
        'Snackbar dialog: $operationName was successful $successMessage',
      );

      print('User: ${userModelToJson(user)}');
      // print('User: ${FirebaseAuth.instance.currentUser!}');
    }
  }

  Future<void> _handleHiddenAccountOperation({
    required String operationName,
    String? customErrorMessage,
    required Future<void> Function() authOperation,
  }) async {
    try {
      await authOperation();
    } catch (error) {
      Get.snackbar(
        '$operationName failed',
        customErrorMessage == null
            ? '$error'
            : '$customErrorMessage: $error',
        snackPosition: SnackPosition.BOTTOM,
        borderRadius: 4,
        margin: const EdgeInsets.all(0),
      );
      if (kDebugMode) {
        String message =
            customErrorMessage == null
                ? '$error'
                : '$customErrorMessage: $error';
        print(
          'Snackbar dialog: $operationName has failed $message',
        );
      }

      return;
    }
  }
}
