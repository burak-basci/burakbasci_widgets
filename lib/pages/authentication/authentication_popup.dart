import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'account_controller.dart';

class AuthenticationPopup extends StatelessWidget {
  const AuthenticationPopup({super.key});

  static final AccountController authentication =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return authentication.getCurrentAuthenticationPage();
    });
  }
}
