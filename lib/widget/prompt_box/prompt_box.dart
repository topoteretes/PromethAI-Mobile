import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:prometh_ai/ext/string_ext.dart';
import 'package:prometh_ai/model/tree.dart';
import 'package:prometh_ai/settings.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/state/tree.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/utils/logger.dart';
import 'package:prometh_ai/widget/input_text.dart';
import 'package:prometh_ai/widget/prompt_box/mic_button.dart';
import 'package:prometh_ai/widget/prompt_box/reload_button.dart';

class PromptBox extends HookConsumerWidget {
  final String title;

  const PromptBox({required this.title, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordState = ref.watch(RecordStateNotifier.provider);
    final deepgramNotifier = ref.read(DeepgramNotifier.provider.notifier);
    final treeNotifier = ref.read(TreeNotifier.provider.notifier);

    final tree = ref.watch(TreeNotifier.provider);
    final deepgram = ref.watch(DeepgramNotifier.provider);
    final path = ref.watch(PathNotifier.provider);
    final rootPath = path.sublist(0, path.length - 1);
    final menuGoals = tree.findMenu(rootPath);

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

    return SizedBox(
      height: 51,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: M.normal),
          Expanded(
              child: Focus(
            onFocusChange: (hasFocus) => isEditing.value = hasFocus,
            child: Stack(
              children: [
                IgnorePointer(
                  ignoring: recordState != RecordState.idle,
                  child: InputText(
                      controller: inputController,
                      backgroundColor: C.grey2,
                      focusNode: focusNode,
                      placeholder: title,
                      borderColor: C.grey2,
                      onChanged: deepgramNotifier.update),
                ),
                if (!isEditing.value)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: MicButton(
                        onStart: () => deepgramNotifier.startRecord(inputController.text),
                        recordState: recordState,
                      ),
                    ),
                  ),
              ],
            ),
          )),
          const SizedBox(width: M.small),
          ReloadButton(
            onStop: deepgramNotifier.stopRecord,
            onDone: () => focusNode.unfocus(),
            onReload: inputController.text.isNotBlank
                ? () {
                    L.d("----->rootPath: ${rootPath}");
                    L.d("----->menuGoals: ${menuGoals}");
                    treeNotifier.replaceGoals(rootPath, menuGoals, inputController.text);
                    inputController.text = "";
                  }
                : null,
            recordState: recordState,
            isEditing: isEditing.value,
          ),
          const SizedBox(width: M.normal),
        ],
      ),
    );
  }
}
