import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/enums.dart';
import '../../../widgets/buttons/go_back_button.dart';
import '../account_controller.dart';
import '../authentication_background.dart';

class TermsAndDataPolicyPage extends StatefulWidget {
  const TermsAndDataPolicyPage({super.key});

  @override
  State<TermsAndDataPolicyPage> createState() =>
      _TermsAndDataPolicyPageState();
}

class _TermsAndDataPolicyPageState
    extends State<TermsAndDataPolicyPage>
    with TickerProviderStateMixin {
  final GlobalKey _key = GlobalKey();

  static late Animation<double>? termsAndPolicyAnimation;

  static final AccountController account = Get.find();

  @override
  void initState() {
    _animation();
    super.initState();
  }

  Future<void> _animation() async {
    final AnimationController termsAndPolicyController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 500),
        )..addListener(() {
          setState(() {});
        });
    termsAndPolicyAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(termsAndPolicyController);
    termsAndPolicyController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBackground(
      child: FadeTransition(
        key: _key,
        opacity: termsAndPolicyAnimation!,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Text(
                'Data Policy Text'.tr,
                softWrap: true,
              ),
            ),
            GoBackButton(
              title: 'SIGNUP_Page'.tr,
              function: () {
                account.setCurrentAuthenticationPage(
                  authPage: AuthPage.signUp,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
