import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormTextFieldTitle extends StatelessWidget {
  const FormTextFieldTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        title,
        style: Get.theme.textTheme.titleLarge?.apply(
          shadows: <Shadow>[
            Shadow(
              color: Colors.black.withOpacity(0.5),
              offset: const Offset(1.5, 1.5),
              blurRadius: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
