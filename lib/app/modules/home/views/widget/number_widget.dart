import 'package:flutter/material.dart';

class NumbersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          content(context, '100k', 'Like'),
          verticalDivide(),
          content(context, '12', 'Following'),
          verticalDivide(),
          content(context, '49', 'Followers'),
        ],
      );
  Widget verticalDivide() => const SizedBox(
        height: 24,
        child: VerticalDivider(),
      );

  Widget content(BuildContext context, String value, String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      );
}
