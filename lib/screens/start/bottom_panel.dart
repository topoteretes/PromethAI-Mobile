import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';
import 'package:prometh_ai/widget/vec_pic.dart';

class BottomPanel extends HookConsumerWidget {
  const BottomPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appState = ref.watch(AppStateNotifier.provider);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);

    final selectCenter = appState != AppState.settings && appState != AppState.history;
    return Container(
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
            CircleButton(
              icon: "settings",
              iconSize: 20,
              onPressed: appStateNotifier.settings,
              size: 40,
              color: appState == AppState.settings ? C.white : C.front,
              iconColor: appState == AppState.settings ? C.front : C.white,
            ),
            InkWell(
              onTap: appStateNotifier.start,
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                height: 49,
                decoration: BoxDecoration(
                  color: selectCenter ? C.white : C.front,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 6),
                      child: VecPic("bowl", iconSize: 14, color: selectCenter ? C.front : C.white),
                    ),
                    Text(
                      'My Meal',
                      style: tt(context).bodyMedium!.copyWith(color: selectCenter ? C.front : C.white),
                    ),
                  ],
                ),
              ),
            ),
            CircleButton(
              icon: "time_machine",
              iconSize: 20,
              onPressed: appStateNotifier.history,
              size: 40,
              color: appState == AppState.history ? C.white : C.front,
              iconColor: appState == AppState.history ? C.front : C.white,
            ),
          ]),
        ));
  }
}
