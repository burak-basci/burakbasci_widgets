import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoBackButton extends StatelessWidget {
  const GoBackButton({
    required this.title,
    required this.function,
    super.key,
  });

  final String title;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: function,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_left,
                color: Colors.grey.shade400,
                size: 24,
                shadows: <Shadow>[
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(1.5, 1.5),
                    blurRadius: 4.0,
                  ),
                ],
              ),
              Text(
                'Go Back to'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  shadows: <Shadow>[
                    Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(1.5, 1.5),
                      blurRadius: 4.0,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
              shadows: <Shadow>[
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  offset: const Offset(2, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
