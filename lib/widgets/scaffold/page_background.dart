import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({
    super.key,
    required this.child,
    required this.constraints,
    this.isScrollView = true,
  });

  final Widget child;
  final BoxConstraints constraints;
  final bool isScrollView;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:
          isScrollView
              ? BackgroundGradient(
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: constraints.copyWith(
                      minHeight: constraints.maxHeight,
                      maxHeight: double.infinity,
                    ),
                    child: PageContent(child: child),
                  ),
                ),
              )
              : BackgroundGradient(
                child: ConstrainedBox(
                  constraints: constraints.copyWith(
                    minHeight: constraints.maxHeight,
                    maxHeight: double.infinity,
                  ),
                  child: PageContent(child: child),
                ),
              ),
    );
  }
}

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: <Color>[
            Get.theme.colorScheme.surface,
            Get.theme.dialogTheme.backgroundColor!,
            Get.theme.colorScheme.surface,
          ],
        ),
      ),
      child: child,
    );
  }
}

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[Center(child: child)],
    );
  }
}
