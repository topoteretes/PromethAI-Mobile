import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/audiowaveforms/audio_waveforms.dart';
import 'package:prometh_ai/audiowaveforms/base/wave_style.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/state/last_recipe.dart';
import 'package:prometh_ai/state/prompt.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:prometh_ai/widget/asmall_button.dart';
import 'package:prometh_ai/widget/bottom_round_card.dart';
import 'package:prometh_ai/widget/circle_button.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/progress.dart';
import 'package:prometh_ai/widget/prompt_box/mic_button.dart';
import 'package:prometh_ai/widget/theme_selectors.dart';

typedef OnChange = void Function(String);

class PromptBox extends HookConsumerWidget {
  final String title;

  const PromptBox({required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    final recordState = ref.watch(RecordStateNotifier.provider);
    final deepgram = ref.watch(DeepgramNotifier.provider);
    final currentPrompt = ref.watch(PromptNotifier.provider.select((p) => p.current));
    final promptUpdating = ref.watch(PromptNotifier.provider.select((p) => p.updating));
    final promptNotifier = ref.read(PromptNotifier.provider.notifier);
    final appStateNotifier = ref.read(AppStateNotifier.provider.notifier);

    final inputController = useTextEditingController();
    final focusNode = useFocusNode();
    final isEditing = useState<bool>(false);
    final isTextInput = useState<bool>(true);
    final appState = ref.watch(AppStateNotifier.provider);
    final lastRecipeNotifier = ref.read(LastRecipeNotifier.provider.notifier);

    inputListener() {
      deepgramNotifier.update(inputController.text);
    }

    useEffect(() {
      if (deepgram != inputController.text) {
        inputController.text = deepgram;
      }
      return null;
    }, [deepgram]);

    useEffect(() {
      if (currentPrompt != inputController.text) {
        afterDelay(Duration.zero, () {
          inputController.text = currentPrompt;
        });
      }
      return null;
    }, [currentPrompt]);

    useEffect(() {
      if (isTextInput.value) {
        deepgramNotifier.stopRecord();
        //focusNode.requestFocus();
      } else {
        focusNode.unfocus();
      }

      inputController.addListener(inputListener);
      return () => inputController.removeListener(inputListener);
    }, [isTextInput.value]);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BottomRoundCard(
          child: Container(
            color: C.grey7,
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Focus(
              onFocusChange: (hasFocus) {
                isEditing.value = hasFocus;
                if (hasFocus) {
                  isTextInput.value = true;
                }
              },
              child: Column(
                children: [
                  if (!isTextInput.value && appState == AppState.start)
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      child: AudioWaveforms(
                        size: Size(MediaQuery.of(context).size.width, 40),
                        backgroundColor: Colors.green,
                        recorderController: deepgramNotifier.recordController,
                        waveStyle: const WaveStyle(
                          waveColor: C.white,
                          spacing: 4.0,
                          scaleFactor: 1.0,
                          waveThickness: 2.0,
                          extendWaveform: true,
                          showMiddleLine: false,
                        ),
                      ),
                    ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Opacity(
                        opacity: promptUpdating ? 0 : 1,
                        child: InputText(
                            controller: inputController,
                            backgroundColor: C.white,
                            focusNode: focusNode,
                            placeholder: title,
                            borderColor: C.grey2,
                            suffixIcon: inputController.text.isEmpty
                                ? null
                                : IconButton(
                                    icon: const Icon(Icons.delete),
                                    color: C.front,
                                    onPressed: () {
                                      inputController.clear();
                                      promptNotifier.reset("");
                                      appStateNotifier.start();
                                      lastRecipeNotifier.reset();
                                    }),
                            readOnly: appState != AppState.start,
                            onChanged: deepgramNotifier.update),
                      ),
                      if (promptUpdating) const Progress()
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        if (appState == AppState.start)
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 166,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            AnimatedSlide(
                              duration: A.fast,
                              offset: Offset(isTextInput.value ? 0 : 1, 0),
                              curve: CV.normal,
                              child: AnimatedScale(
                                duration: A.fast,
                                scale: isTextInput.value ? 0.8 : 1,
                                curve: CV.normal,
                                child: InkWell(
                                  onTap: isTextInput.value ? () => isTextInput.value = false : null,
                                  child: MicButton(
                                      onStart: () => deepgramNotifier.startRecord(inputController.text),
                                      onStop: () => deepgramNotifier.stopRecord(),
                                      recordState: recordState,
                                      enabled: !isTextInput.value),
                                ),
                              ),
                            ),
                            AnimatedSlide(
                              duration: A.fast,
                              offset: Offset(isTextInput.value ? 1 : 0, 0),
                              curve: CV.normal,
                              child: AnimatedScale(
                                duration: A.fast,
                                scale: isTextInput.value ? 1 : 0.8,
                                curve: CV.normal,
                                child: InkWell(
                                  onTap: !isTextInput.value ? () => isTextInput.value = true : null,
                                  child: CircleButton(
                                    icon: "text",
                                    size: 56,
                                    color: C.front,
                                    iconSize: 24,
                                    enabled: isTextInput.value,
                                    onPressed: focusNode.requestFocus,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        isTextInput.value ? "Tap to record" : "Tap to type",
                        style: tt(context).bodyLarge!.copyWith(color: C.grey3, fontSize: 10),
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    width: 100,
                    child: Opacity(
                      opacity: inputController.text.isNotEmpty ? 1 : 0,
                      child: ASmallButton(
                        title: "Submit",
                        enabled: inputController.text != currentPrompt,
                        onPressed: () {
                          focusNode.unfocus();
                          final prompt = inputController.text;
                          promptNotifier.reset(prompt);
                          appStateNotifier.prefetchTree(prompt: prompt);
                          appStateNotifier.refine();
                          lastRecipeNotifier.refresh(prompt);
                        },
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
      ],
    );
  }
}
