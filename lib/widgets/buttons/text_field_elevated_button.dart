import 'package:flutter/material.dart';

import '../../../utils/enums.dart';
import 'general_gradient_button.dart';

class EndOfTextFieldElevatedButton extends StatelessWidget {
  const EndOfTextFieldElevatedButton({
    super.key,
    required this.onTap,
    this.child,
    this.generalButtonType,
    this.width,
    this.height,
  });

  final Future<void> Function() onTap;
  final Icon? child;
  final GeneralButtonType? generalButtonType;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return GeneralGradientButton(
      width: width ?? 64.0,
      height: height ?? 48,
      generalButtonType:
          generalButtonType ?? GeneralButtonType.emphasized,
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      ),
      onTap: onTap,
      child: child ?? const Icon(Icons.search),
    );
  }
}
