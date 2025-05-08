import 'package:flutter/material.dart';

import 'custom_divider.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          children: <Widget>[
            CustomDivider(
              length: constraint.maxWidth * 0.5 - 16,
              thickness: 1,
              indent: 2,
              endIndent: 20,
            ),
            const Text(
              'Or',
              style: TextStyle(color: Colors.grey),
            ),
            CustomDivider(
              length: constraint.maxWidth * 0.5 - 16,
              thickness: 1,
              indent: 20,
              endIndent: 2,
            ),
          ],
        );
      },
    );
  }
}
