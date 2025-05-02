import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/utils/enums.dart';

class GeneralGradientButton extends StatelessWidget {
  const GeneralGradientButton({
    super.key,
    required this.onTap,
    required this.generalButtonType,
    required this.child,
    this.borderRadius,
    this.border,
    this.width,
    this.height,
  });

  final void Function() onTap;
  final GeneralButtonType generalButtonType;
  final Widget child;
  final BorderRadius? borderRadius;
  final Border? border;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    List<Color> colorGradient() {
      if (generalButtonType == GeneralButtonType.emphasized) {
        return <Color>[
          Get.theme.primaryColor.withValues(alpha: .87),
          // Get.theme.primaryColorLight.withValues(alpha: .87),
          Get.theme.primaryColor.withValues(alpha: .87),
        ];
      } else if (generalButtonType == GeneralButtonType.unEmphasized) {
        return <Color>[
          Colors.grey.shade500,
          // Colors.grey.shade600,
          Colors.grey.shade500,
          // Colors.grey.shade600,
        ];
      } else if (generalButtonType == GeneralButtonType.outlined) {
        return <Color>[Colors.transparent, Colors.transparent];
      } else {
        if (kDebugMode) {
          print('colorGradient Error in GeneralGradientButton');
        }
        return <Color>[Colors.red, Colors.red];
      }
    }

    return Container(
      constraints: BoxConstraints.expand(
        height: height ?? 51.0,
        width: width ?? double.infinity,
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        border: border,
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: colorGradient(),
        ),
      ),
      child: ClipRRect(
        borderRadius: borderRadius ?? BorderRadius.circular(8.0),
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () async {
              onTap();
            },
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
