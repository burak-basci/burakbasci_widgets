import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationBackground extends StatelessWidget {
  const AuthenticationBackground({
    required this.child,
    super.key,
  });

  final Widget child;

  static final double width =
      (Get.width - 256) > 1600
          ? (1600 - 256) * 0.7
          : (Get.width - 256);

  @override
  Widget build(BuildContext context) {
    double width =
        (Get.width - 128) > 960
            ? (960 - 128)
            : (Get.width - 128);

    return SizedBox(
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(48.0),
        child: child,
      ),
    );
  }
}
