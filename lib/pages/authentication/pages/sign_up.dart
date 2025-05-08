import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/gradient_elevated_text_button.dart';
import '../../../widgets/text_fields/sub_widgets/general_text_field.dart';
import '../../../widgets/texts/auth_title.dart';
import '../../../widgets/texts/form_textfield_title.dart';
import '../account_controller.dart';
import '../authentication_background.dart';
import '/utils/enums.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage>
    with TickerProviderStateMixin {
  final TextEditingController usernameInputController =
      TextEditingController();
  final TextEditingController emailInputController =
      TextEditingController();
  final TextEditingController passwordInputController =
      TextEditingController();
  final TextEditingController
  repeatPasswordInputController = TextEditingController();

  final FocusNode usernameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode repeatPasswordFocusNode = FocusNode();

  final GlobalKey _key = GlobalKey();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  static late Animation<double>? signUpFadeAnimation;

  @override
  void initState() {
    _animation();
    super.initState();
  }

  @override
  void dispose() {
    usernameInputController.dispose();
    emailInputController.dispose();
    passwordInputController.dispose();
    repeatPasswordInputController.dispose();

    usernameFocusNode.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    repeatPasswordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _animation() async {
    final AnimationController signUpController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        )..addListener(() {
          setState(() {});
        });
    signUpFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(signUpController);
    signUpController.forward();
  }

  static final AccountController account = Get.find();

  Future<void> userSignUp({
    required AccountType accountType,
  }) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await account.accountSignUp(
      username: usernameInputController.text,
      eMail: emailInputController.text,
      password: passwordInputController.text,
      repeatPassword: repeatPasswordInputController.text,
      accountType: accountType,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackground(
      child: FadeTransition(
        key: _key,
        opacity: signUpFadeAnimation!,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// App Title
            const Padding(
              padding: EdgeInsets.only(bottom: 48.0),
              child: Center(
                child: HighlightedTitle(
                  title: 'Your App Name',
                ),
              ),
            ),

            /// Sign Up Text
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8.0,
                left: 8.0,
              ),
              child: FormTextFieldTitle(
                title: 'Sign Up'.tr,
              ),
            ),

            /// SignUp Form with SignUp Button
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  /// Username TextField
                  GeneralTextField(
                    controller: usernameInputController,
                    prefixIcon: Icons.person,
                    labelText: 'Username'.tr,
                    textValidationType:
                        TextValidationType.username,
                    focusNode: usernameFocusNode,
                    nextFocus: emailFocusNode,
                    onFieldSubmitted:
                        (_) => userSignUp(
                          accountType: AccountType.user,
                        ),
                  ),
                  const SizedBox(height: 8.0),

                  /// E-Mail TextField
                  GeneralTextField(
                    controller: emailInputController,
                    prefixIcon: Icons.mail,
                    labelText: 'E-Mail'.tr,
                    textValidationType:
                        TextValidationType.eMail,
                    focusNode: emailFocusNode,
                    nextFocus: passwordFocusNode,
                    onFieldSubmitted:
                        (_) => userSignUp(
                          accountType: AccountType.user,
                        ),
                  ),
                  const SizedBox(height: 8.0),

                  /// Password TextField
                  GeneralTextField(
                    controller: passwordInputController,
                    prefixIcon: Icons.lock,
                    labelText: 'Password'.tr,
                    textValidationType:
                        TextValidationType.password,
                    focusNode: passwordFocusNode,
                    nextFocus: repeatPasswordFocusNode,
                    onFieldSubmitted:
                        (_) => userSignUp(
                          accountType: AccountType.user,
                        ),
                  ),
                  const SizedBox(height: 8.0),

                  /// Password TextField
                  GeneralTextField(
                    controller:
                        repeatPasswordInputController,
                    previousPasswordController:
                        passwordInputController,
                    prefixIcon: Icons.lock,
                    labelText: 'Repeat Password'.tr,
                    textValidationType:
                        TextValidationType.repeatPassword,
                    focusNode: repeatPasswordFocusNode,
                    onFieldSubmitted:
                        (_) => userSignUp(
                          accountType: AccountType.user,
                        ),
                  ),

                  /// Sign Up Button
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: GradientElevatedTextButton(
                      title: 'Create Account'.tr,
                      onTap:
                          () async => userSignUp(
                            accountType: AccountType.user,
                          ),
                    ),
                  ),

                  // /// Sign Up as an admin Button
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //     top: 16.0,
                  //     bottom: 16.0,
                  //     left: 16.0,
                  //     right: 16.0,
                  //   ),
                  //   child: BigButton(
                  //     title: 'Create Account as an admin'.tr,
                  //     isEmphasized: true,
                  //     function: () => userSignUp(accountType: AccountType.admin),
                  //   ),
                  // ),
                ],
              ),
            ),

            /// Terms and Data Policy TextButton
            TextButton(
              onPressed: () {
                account.setCurrentAuthenticationPage(
                  authPage: AuthPage.termsAndPolicy,
                );
              },
              child: RichText(
                text: TextSpan(
                  text:
                      'By clicking \'Create Account\', you agree to our '
                          .tr,
                  style: Get.theme.textTheme.bodyLarge
                      ?.apply(
                        color: Colors.grey.shade400,
                        shadows: <Shadow>[
                          Shadow(
                            color: Colors.black.withOpacity(
                              0.5,
                            ),
                            offset: const Offset(1.5, 1.5),
                            blurRadius: 4.0,
                          ),
                        ],
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Terms and Data Policy'.tr,
                      style: Get.theme.textTheme.bodyLarge
                          ?.apply(
                            color: Get.theme.primaryColor,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black
                                    .withOpacity(0.5),
                                offset: const Offset(
                                  1.5,
                                  1.5,
                                ),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                    ),
                    TextSpan(
                      text: '.'.tr,
                      style: Get.theme.textTheme.bodyLarge
                          ?.apply(
                            color: Colors.grey.shade400,
                            shadows: <Shadow>[
                              Shadow(
                                color: Colors.black
                                    .withOpacity(0.5),
                                offset: const Offset(
                                  1.5,
                                  1.5,
                                ),
                                blurRadius: 4.0,
                              ),
                            ],
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),

            /// Already have an Account TextButton
            TextButton(
              onPressed: () {
                account.setCurrentAuthenticationPage(
                  authPage: AuthPage.login,
                );
              },
              child: Column(
                children: <Widget>[
                  Text(
                    'Already have an Account?'.tr,
                    style: Get.theme.textTheme.bodyMedium
                        ?.apply(
                          color: Colors.grey.shade400,
                          shadows: <Shadow>[
                            Shadow(
                              color: Colors.black
                                  .withOpacity(0.5),
                              offset: const Offset(
                                1.5,
                                1.5,
                              ),
                              blurRadius: 4.0,
                            ),
                          ],
                        ),
                  ),
                  Text(
                    'LOGIN_Action'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor,
                      shadows: <Shadow>[
                        Shadow(
                          color: Colors.black.withOpacity(
                            0.5,
                          ),
                          offset: const Offset(1.5, 1.5),
                          blurRadius: 8.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
