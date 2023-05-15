import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/goal/goal_menu.dart';
import 'package:prometh_ai/screens/goal/one_goal.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/base_screen.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/prompt_box.dart';

class GoalScreen extends HookConsumerWidget {
  final int pathTop;

  const GoalScreen({super.key, required this.pathTop});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);
    final pathNotifier = ref.read(PathNotifier.provider.notifier);

    final tree = ref.watch(TreeNotifier.provider);
    final fullPath = ref.watch(PathNotifier.provider);

    final previousFullPath = usePrevious(fullPath);
    final path = (fullPath.length < pathTop ? (previousFullPath ?? []) : fullPath).sublist(0, pathTop);

    final selectedGoal = tree.findSelected(path);
    final menuGoals = tree.findMenu(path);

    final pageController = usePageController();

    scrollToBottom(int index, bool animated) {
      if (pageController.hasClients) {
        if (animated) {
          pageController.animateToPage(index, duration: A.normal, curve: Curves.easeInOut);
        } else {
          pageController.jumpToPage(index);
        }
      } else {
        Timer(A.fast, () => scrollToBottom(index, animated));
      }
    }

    useEffect(() {
      scrollToBottom(menuGoals.indexOf(selectedGoal), false);
      return null;
    }, [menuGoals]);

    useEffect(() {
      scrollToBottom(menuGoals.indexOf(selectedGoal), true);
      return null;
    }, [selectedGoal]);

    final hasGoals = menuGoals.first.children.isNotEmpty;

    return BaseScreen(
        child: SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AIconButton(
            onPressed: path.length == 1 ? appStateNotifier.start : pathNotifier.back,
            icon: Icons.keyboard_arrow_up_rounded,
            size: 32,
          ),
          const SizedBox(height: M.small),
          GoalMenu(path: path),
          const SizedBox(height: M.normal),
          (menuGoals.isEmpty)
              ? const ExCentProgress()
              : Flexible(
                  child: Container(
                    color: C.grey3,
                    padding: const EdgeInsets.all(M.normal),
                    child: Column(
                      children: [
                        const PromptBox(
                          title: "Question",
                          restart: true,
                        ),
                        const SizedBox(height: M.large),
                        Expanded(
                          child: PageView(
                            physics: const NeverScrollableScrollPhysics(),
                            controller: pageController,
                            children: menuGoals.mapp((g) => OneGoal(node: g)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.only(top: M.normal, left: M.normal, right: M.normal),
            child: Column(
              children: [
                if (hasGoals) AButton(title: "Show results", onPressed: appStateNotifier.result),
                AButton(
                  title: "Exit & save journey",
                  onPressed: () => confirmDialog(context, onSure: journeyNotifier.exitAndSave),
                  inverted: true,
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
