import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarLeadingTitle extends StatelessWidget {
  const AppBarLeadingTitle({
    super.key,
    required this.appBarHeight,
    required this.title,
    required this.routeToGetTo,
  });

  final double appBarHeight;
  final String title;
  final String routeToGetTo;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.offAllNamed(routeToGetTo);
      },
      child: SizedBox(
        height: appBarHeight,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              title,
              style: Get.textTheme.titleLarge?.copyWith(fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
