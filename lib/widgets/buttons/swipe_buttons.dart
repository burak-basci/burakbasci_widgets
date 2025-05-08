import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../utils/enums.dart';
import 'general_gradient_button.dart';

class SwipeButton extends StatelessWidget {
  const SwipeButton({
    required this.controller,
    required this.isSwipeRight,
    required this.onTap,
    super.key,
  });

  final CarouselController controller;
  final bool isSwipeRight;
  final void Function() onTap;

  static const Duration duration = Duration(
    milliseconds: 400,
  );

  @override
  Widget build(BuildContext context) {
    return GeneralGradientButton(
      onTap: onTap,
      width: 80,
      height: 80,
      generalButtonType: GeneralButtonType.outlined,
      child:
          isSwipeRight
              ? const Icon(
                FontAwesomeIcons.angleRight,
                size: 64.0,
              )
              : const Icon(
                FontAwesomeIcons.angleLeft,
                size: 64.0,
              ),
    );
  }
}
