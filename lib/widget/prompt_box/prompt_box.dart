import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/state/app_state.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/circle_icon_button.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/prompt_box/mic_button.dart';

typedef OnChange = void Function(String);

class PromptBox extends HookConsumerWidget {
  final String title;

  const PromptBox({required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    final recordState = ref.watch(RecordStateNotifier.provider);
    final deepgram = ref.watch(DeepgramNotifier.provider);
    final appState = ref.watch(AppStateNotifier.provider);

    final inputController = useTextEditingController();
    final focusNode = useFocusNode();
    final isEditing = useState<bool>(false);

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
      if (appState == AppState.inputText) {
        deepgramNotifier.stopRecord();
        focusNode.requestFocus();
      }
      if (appState == AppState.inputVoice) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          focusNode.unfocus();
          deepgramNotifier.startRecord(inputController.text);
        });
      }

      inputController.addListener(inputListener);
      return () => inputController.removeListener(inputListener);
    }, [appState]);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Focus(
            onFocusChange: (hasFocus) => isEditing.value = hasFocus,
            child: InputText(
                controller: inputController,
                backgroundColor: C.grey5,
                focusNode: focusNode,
                placeholder: title,
                borderColor: C.grey2,
                suffixIcon: inputController.text.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.clear),
                        color: C.front,
                        onPressed: inputController.clear,
                      ),
                onChanged: deepgramNotifier.update),
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
