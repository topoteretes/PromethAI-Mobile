import 'dart:math';

import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/texts/normal_title.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 2.5,
            child: Transform.translate(
              offset: const Offset(-50, 40),
              child: Transform.rotate(
                angle: -pi / 180 * 17,
                child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 3,
                  height: 63,
                  color: C.front,
                  child: Row(
                      children: List.generate(
                          4,
                          (i) => const NormalTitle(
                                "  Coming soon!  ",
                                inverted: true,
                              )).toList()),
                ),
              ),
            ),
          ),
        ),
      );
}
