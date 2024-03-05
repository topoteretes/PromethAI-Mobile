import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/texts/large_body.dart';

import 'vec_pic.dart';

class ABackButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ABackButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Row(
          children: [
            const VecPic(
              "chevron",
              iconSize: 22,
              color: C.front,
            ),
            const SizedBox(width: 8),
            LargeBody(
              title,
              color: C.front,
            ),
          ],
        ),
      );
}
