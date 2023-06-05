import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/after_delay.dart';
import 'package:prometh_ai/widget/circle_icon_button.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/prompt_box/mic_button.dart';

typedef OnChange = void Function(String);

class PromptBox extends HookConsumerWidget {
  final String title;
  final OnChange? onChange;

  const PromptBox({required this.title, this.onChange, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordState = ref.watch(RecordStateNotifier.provider);
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    final deepgram = ref.watch(DeepgramNotifier.provider);
    final appState = ref.watch(AppStateNotifier.provider);

    final inputController = useTextEditingController();
    final focusNode = useFocusNode();
    final isEditing = useState(false);

    useEffect(() {
      if (deepgram != inputController.text) {
        inputController.text = deepgram;
      }
      return null;
    }, [deepgram]);

    useEffect(() {
      if (!isEditing.value) {
        deepgramNotifier.stopRecord();
      }
      return null;
    }, [isEditing.value]);

    useEffect(() {
      if (appState == AppState.inputText) {
        focusNode.requestFocus();
      }
      if (appState == AppState.inputVoice) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          deepgramNotifier.startRecord(inputController.text);
        });
      }

      inputController.addListener(() {
        onChange?.call(inputController.text);
      });
      return null;
    }, []);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Focus(
            onFocusChange: (hasFocus) => isEditing.value = hasFocus,
            child: IgnorePointer(
              ignoring: recordState != RecordState.idle,
              child: InputText(
                  controller: inputController,
                  backgroundColor: C.grey5,
                  focusNode: focusNode,
                  placeholder: title,
                  borderColor: C.grey2,
                  onChanged: deepgramNotifier.update),
            ),
          ),
        ),
        const SizedBox(width: 10),
        if (!isEditing.value)
          MicButton(
            onStart: () => deepgramNotifier.startRecord(inputController.text),
            onStop: () => deepgramNotifier.stopRecord(),
            recordState: recordState,
          ),
        if (isEditing.value)
          SizedBox(
              width: 40,
              child: CircleIconButton(
                onPressed: focusNode.unfocus,
                icon: Icons.check,
                iconSize: 32,
                size: 32,
              )),
      ],
    );
  }
}
