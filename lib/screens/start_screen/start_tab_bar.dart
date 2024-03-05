import 'package:flutter/material.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class _TabItem extends StatelessWidget {
  final String vector;
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const _TabItem({
    required this.vector,
    required this.title,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 4),
            VecPic(vector, iconSize: 26, color: selected ? C.front : C.grey3),
            const SizedBox(height: 4),
            Text(
              title,
              style: tt(context).labelSmall!.copyWith(color: selected ? C.front : C.grey3),
            )
          ],
        ),
      );
}

class StartTabBar extends StatelessWidget {
  final void Function(int index) onChangeTab;
  final int selectedIndex;

  const StartTabBar({super.key, required this.onChangeTab, required this.selectedIndex});

  @override
  Widget build(BuildContext context) => Container(
        color: C.grey7,
        padding: const EdgeInsets.only(top: 4, bottom: 8),
        child: SafeArea(
          top: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _TabItem(
                title: "Meal Wiz",
                vector: "meal_wiz",
                selected: selectedIndex == 0,
                onTap: () => onChangeTab(0),
              ),
              _TabItem(
                title: "Your cookbook",
                vector: "time_machine",
                selected: selectedIndex == 1,
                onTap: () => onChangeTab(1),
              ),
              _TabItem(
                title: "Account",
                vector: "settings",
                selected: selectedIndex == 2,
                onTap: () => onChangeTab(2),
              ),
            ],
          ),
        ),
      );
}
