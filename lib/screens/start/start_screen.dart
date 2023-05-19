import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/state/selected_journey.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:prometh_ai/widget/abutton.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/pill_button.dart';
import 'package:vector_graphics/vector_graphics.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);
    final selectedJourneyNotifier = ref.watch(SelectedJourneyNotifier.provider.notifier);
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    final tree = ref.watch(TreeNotifier.provider);

    useEffect(async(journeyNotifier.startNew), []);

    return Scaffold(
      backgroundColor: C.back,
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: C.front,
              alignment: Alignment.bottomCenter,
              height: 120,
              child: const SvgPicture(
                AssetBytesLoader('assets/svgs/hug.svg.vec'),
                height: 72,
              ),
            ),
            const Spacer(),
            if (tree == Tree.empty) const ExCentProgress(),
            if (tree != Tree.empty) ...tree.children.mapp((c) => PillButton(title: c.name, onPressed: () => treeNotifier.goDown(c))),
            const Spacer(),
            AButton(onPressed: selectedJourneyNotifier.open, title: "Previous meals ->", inverted: true),
          ],
        ),
      ),
    );
  }
}
