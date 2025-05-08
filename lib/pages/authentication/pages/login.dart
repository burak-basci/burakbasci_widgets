import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/gradient_elevated_text_button.dart';
import '../../../widgets/design/or_divider.dart';
import '../../../widgets/text_fields/sub_widgets/general_text_field.dart';
import '../../../widgets/texts/auth_title.dart';
import '../../../widgets/texts/form_textfield_title.dart';
import '../account_controller.dart';
import '../authentication_background.dart';
import '/utils/enums.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with TickerProviderStateMixin {
  final TextEditingController usernameInputController =
      TextEditingController();
  final TextEditingController passwordInputController =
      TextEditingController();

  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final GlobalKey _key = GlobalKey();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  static late Animation<double>? loginFadeAnimation;

  static const double dialogPadding = 48;

  @override
  void initState() {
    _animation();
    super.initState();
  }

  @override
  void dispose() {
    usernameInputController.dispose();
    passwordInputController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  Future<void> _animation() async {
    final AnimationController loginController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        )..addListener(() {
          setState(() {});
        });
    loginFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(loginController);
    loginController.forward();
  }

  static final double width =
      Get.mediaQuery.size.shortestSide * 0.7;

  static final AccountController account = Get.find();

  Future<void> userLogin() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    await account.accountLogin(
      username: usernameInputController.text,
      password: passwordInputController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackground(
      child: FadeTransition(
        key: _key,
        opacity: loginFadeAnimation!,
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

            /// Sign In Text
            Padding(
              padding: const EdgeInsets.only(
                left: 8.0,
                bottom: 8.0,
              ),
              child: FormTextFieldTitle(
                title: 'Sign In'.tr,
              ),
            ),

            /// Login Forms & Login Button
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  /// Username TextField
                  GeneralTextField(
                    controller: usernameInputController,
                    prefixIcon: Icons.email,
                    labelText: 'E-Mail'.tr,
                    textValidationType:
                        TextValidationType.username,
                    focusNode: emailFocusNode,
                    nextFocus: passwordFocusNode,
                    onFieldSubmitted: (_) => userLogin(),
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
                    onFieldSubmitted: (_) => userLogin(),
                  ),

                  /// Login Button
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 8.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: GradientElevatedTextButton(
                      title: 'Login'.tr,
                      onTap: userLogin,
                    ),
                  ),
                ],
              ),
            ),

            /// Login Options
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  /// Remember me TextButton
                  // TextButton(
                  //   onPressed: () => authentication.setRememberMe(rememberMe: !authentication.rememberMe.value),
                  //   child: Row(
                  //     children: <Widget>[
                  //       Obx(() {
                  //         if (authentication.rememberMe.value) {
                  //           return Icon(
                  //             Icons.check_box,
                  //             color: Get.theme.primaryColor,
                  //             size: 20.0,
                  //           );
                  //         } else {
                  //           return Icon(
                  //             Icons.check_box_outline_blank,
                  //             color: Colors.grey.shade400,
                  //             size: 20.0,
                  //           );
                  //         }
                  //       }),
                  //       const SizedBox(width: 4.0),
                  //       Text(
                  //         'Remember Me'.tr,
                  //         style: Get.theme.textTheme.titleMedium?.apply(
                  //           color: Colors.grey.shade400,
                  //           shadows: <Shadow>[
                  //             Shadow(
                  //               color: Colors.black.withOpacity(0.5),
                  //               offset: const Offset(1.5, 1.5),
                  //               blurRadius: 4.0,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  /// Forgot Password TextButton
                  TextButton(
                    onPressed: () {
                      account.setCurrentAuthenticationPage(
                        authPage: AuthPage.forgotPassword,
                      );
                    },
                    child: Text(
                      'Forgot Password?'.tr,
                      style: Get.theme.textTheme.titleMedium
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
                  ),
                ],
              ),
            ),

            const SizedBox(height: 4.0),

            /// Don't have an account? TextButton
            TextButton(
              onPressed: () {
                account.setCurrentAuthenticationPage(
                  authPage: AuthPage.signUp,
                );
              },
              child: Column(
                children: <Widget>[
                  Text(
                    'Don\'t have an account?'.tr,
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
                    'To_SIGN UP'.tr,
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

            const SizedBox(height: 16.0),

            Column(
              children: <Widget>[
                /// Continue Offline
                const OrDivider(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 16.0,
                    left: 16.0,
                    right: 16.0,
                  ),
                  child: GradientElevatedTextButton(
                    title: 'Continue Offline'.tr,
                    onTap: () async => Get.back,
                    generalButtonType:
                        GeneralButtonType.unEmphasized,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
