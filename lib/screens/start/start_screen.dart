import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/list_ext.dart';
import 'package:prometh_ai/hook/use_path.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/screens/previous_journeys/journey_item.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/journey.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/state/user_id.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:prometh_ai/widget/ex_cent_progress.dart';
import 'package:prometh_ai/widget/pill_button.dart';
import 'package:prometh_ai/widget/texts/section_title.dart';
import 'package:prometh_ai/widget/top_menu/top_menu.dart';
import 'package:vector_graphics/vector_graphics.dart';

class StartScreen extends HookConsumerWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final journeyNotifier = ref.read(JourneyNotifier.provider.notifier);
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);
    final journey = ref.watch(JourneyNotifier.provider);

    final userId = ref.watch(UserIdNotifier.provider);
    final tree = ref.watch(TreeNotifier.provider);
    final path = usePath(ref, 1);
    final selectedGoal = tree.findSelected(path.value);

    useEffect(async((journeyNotifier.start)), []);

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
            TopMenu(path: path.value),
            const Spacer(),
            if (userId == null) const ExCentProgress(),
            if (userId != null)
              ...selectedGoal.children.mapp((c) => PillButton(title: c.name, onPressed: () => treeNotifier.goDown(c, forceAmount: 100))),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: M.normal),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    const SectionTitle("Previous meals"),
                    ...journey.mapp((j) => InkWell(
                          onTap: () => journeyNotifier.resume(j),
                          child: JourneyItem(journey: j),
                        )),
                    // const SectionTitle("Recommendations"),
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
