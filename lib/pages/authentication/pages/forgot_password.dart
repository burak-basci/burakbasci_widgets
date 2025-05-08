import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/buttons/go_back_button.dart';
import '../../../widgets/buttons/gradient_elevated_text_button.dart';
import '../../../widgets/text_fields/sub_widgets/general_text_field.dart';
import '../../../widgets/texts/auth_title.dart';
import '../../../widgets/texts/form_textfield_title.dart';
import '../account_controller.dart';
import '../authentication_background.dart';
import '/utils/enums.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  ForgotPasswordPageState createState() =>
      ForgotPasswordPageState();
}

class ForgotPasswordPageState
    extends State<ForgotPasswordPage>
    with TickerProviderStateMixin {
  final TextEditingController emailInputController =
      TextEditingController();

  final GlobalKey _key = GlobalKey();
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>();

  static late Animation<double>? loginFadeAnimation;

  static final AccountController account = Get.find();

  @override
  void initState() {
    _animation();
    super.initState();
  }

  @override
  void dispose() {
    emailInputController.dispose();
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

  Future<void> forgotPassword() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    await account.resetPassword(
      eMail: emailInputController.text,
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
                bottom: 8.0,
                left: 8.0,
              ),
              child: FormTextFieldTitle(
                title: 'Forgot Password'.tr,
              ),
            ),

            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  /// Password TextField
                  GeneralTextField(
                    controller: emailInputController,
                    prefixIcon: Icons.mail,
                    labelText: 'E-Mail'.tr,
                    textValidationType:
                        TextValidationType.eMail,
                    onFieldSubmitted:
                        (_) => forgotPassword(),
                  ),

                  /// Send Recovery Code Button
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                      left: 16.0,
                      right: 16.0,
                    ),
                    child: GradientElevatedTextButton(
                      title: 'Send Recovery Code'.tr,
                      onTap: forgotPassword,
                    ),
                  ),
                ],
              ),
            ),

            /// Don't have an account? TextButton
            GoBackButton(
              title: 'LOGIN_Page'.tr,
              function: () {
                account.setCurrentAuthenticationPage(
                  authPage: AuthPage.login,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
