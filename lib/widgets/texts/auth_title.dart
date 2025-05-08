import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HighlightedTitle extends StatelessWidget {
  const HighlightedTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        shadows: <Shadow>[
          Shadow(
            color: Colors.black.withOpacity(0.5),
            offset: const Offset(4.0, 4.0),
            blurRadius: 12.0,
          ),
          Shadow(
            color: Get.theme.primaryColorLight,
            blurRadius: 2.0,
          ),
        ],
        color: Get.theme.primaryColor,
        fontSize: 52,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
