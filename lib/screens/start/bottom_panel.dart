import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class BottomPanel extends StatelessWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context) => Container(
      padding: const EdgeInsets.fromLTRB(60, 16, 60, 8),
      width: double.infinity,
      height: 111,
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: C.front,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(32),
          topRight: Radius.circular(32),
        ),
      ),
      child: SizedBox(
        height: 49,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.center, children: [
          const VecPic("settings", iconSize: 20),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
            height: 49,
            decoration: BoxDecoration(
              color: C.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 6),
                  child: const VecPic("bowl", iconSize: 14, color: C.front),
                ),
                Text(
                  'My Meal',
                  style: tt(context).bodyMedium,
                ),
              ],
            ),
          ),
          const VecPic("time_machine", iconSize: 20),
        ]),
      ));
}
