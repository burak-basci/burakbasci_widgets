import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/buttons/gradient_elevated_text_button.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key, required this.homeRoute});

  final String homeRoute;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '404',
                style: Get.textTheme.displayLarge,
              ),
            ),
            Text(
              'Unfortenately this page does not exist.\n... or got lost in the void',
              softWrap: true,
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 120.0,
                ),
                child: GradientElevatedTextButton(
                  title: 'Go back',
                  onTap:
                      () async => Get.offNamed(homeRoute),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
