import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.length,
    required this.thickness,
    required this.indent,
    required this.endIndent,
  })  : assert(length >= 0.0),
        assert(thickness >= 0.0),
        assert(indent >= 0.0),
        assert(endIndent >= 0.0);

  final double length;
  final double thickness;
  final double indent;
  final double endIndent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: length,
      child: Center(
        child: Container(
          height: thickness,
          color: Get.theme.dividerColor,
          margin: EdgeInsetsDirectional.only(
            start: indent,
            end: endIndent,
          ),
        ),
      ),
    );
  }
}
