import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/hook/use_path.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';
import 'package:prometh_ai/screens/goal/one_goal.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/confirm_dialog.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/slide_switcher.dart';
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

    final selectedSegment = useState(0);
    final path = usePath(ref, pathTop);

    final selectedGoal = tree.findSelected(path.value);
    final menuGoals = tree.findMenu(path.value);

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

    return Scaffold(
      body: SafeArea(
        top: false,
        child: (menuGoals.isEmpty)
            ? const ExCentProgress()
            : Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 63, color: C.front),
                  TopMenu(path: path.value),
                  const SizedBox(height: M.normal),
                  const PromptBox(
                    title: "Question",
                    restart: true,
                  ),
                  const SizedBox(height: M.large),
                  Container(
                    width: 134,
                    height: 33,
                    margin: const EdgeInsets.only(left: M.normal),
                    child: SlideSwitcher(
                      onChange: (value) => async(() => selectedSegment.value = value)(),
                      options: const [SlideSwitcherOption("Range", 0), SlideSwitcherOption("Select", 1)],
                    ),
                  ),
                  const SizedBox(height: M.large),
                  Expanded(
                    child: PageView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: pageController,
                      children: menuGoals.mapp((g) => OneGoal(node: g, isSelect: selectedSegment.value == 1)),
                    ),
                  ),
                  if (hasGoals)
                    Padding(
                      padding: const EdgeInsets.all(M.normal),
                      child: Row(
                        children: [
                          AIconButton(
                              onPressed: pathNotifier.back,
                              icon: Icons.keyboard_arrow_up_rounded,
                              size: 64,
                              iconSize: 32,
                              color: C.grey,
                              hasBorder: true),
                          const SizedBox(width: M.normal),
                          Flexible(child: AButton(title: "Show results", onPressed: appStateNotifier.result)),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: M.normal, right: M.normal),
                    child: AButton(
                      title: "Exit & save journey",
                      onPressed: () => confirmDialog(context, onSure: journeyNotifier.exitAndSave),
                      inverted: true,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
