import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageBackground extends StatelessWidget {
  const PageBackground({
    super.key,
    required this.child,
    this.isScrollView = true,
  });

  final Widget child;
  final bool isScrollView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
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
      },
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
          stops: const <double>[0.0, 0.5, 1.0],
          colors: <Color>[
            Get.theme.colorScheme.surface,
            Get.theme.secondaryHeaderColor,
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
