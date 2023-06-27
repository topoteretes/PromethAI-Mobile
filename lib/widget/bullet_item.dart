import 'package:flutter/widgets.dart';

import 'theme_selectors.dart';

class BulletItem extends StatelessWidget {
  final String title;

  const BulletItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) =>
      Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("\u2022", style: tt(context).bodySmall),
        const SizedBox(width: 8),
        Expanded(
          child: Text(title, style: tt(context).bodySmall),
        )
      ]);
}
