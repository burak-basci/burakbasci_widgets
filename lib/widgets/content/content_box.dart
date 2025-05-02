import 'package:flutter/material.dart';

class ContentBox extends StatelessWidget {
  const ContentBox({
    required this.child,
    super.key,
    this.isMaxWidth = false,
  });

  final Widget child;
  final bool isMaxWidth;

  static const double pageWidth = 1360;

  @override
  Widget build(BuildContext context) {
    if (isMaxWidth) {
      return SizedBox(
        width: double.infinity,
        child: child,
      );
    } else {
      return Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: pageWidth,
          ),
          child: child,
        ),
      );
    }
  }
}
