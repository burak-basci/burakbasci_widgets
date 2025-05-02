import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/enums.dart';

import 'general_gradient_button.dart';

class GradientElevatedTextButton extends StatelessWidget {
  const GradientElevatedTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.style,
    this.generalButtonType,
    this.borderRadius,
    this.border,
    this.width,
    this.height,
  });

  final String title;
  final Future<void> Function() onTap;
  final TextStyle? style;
  final GeneralButtonType? generalButtonType;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GeneralGradientButton(
      width: width,
      height: height,
      generalButtonType: generalButtonType ?? GeneralButtonType.emphasized,
      onTap: onTap,
      borderRadius: borderRadius,
      border: border,
      child: Text(title, style: style ?? Get.theme.textTheme.titleMedium),
    );
  }
}
