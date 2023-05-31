import 'package:flutter/material.dart';
import 'package:prometh_ai/state/deepgram.dart';
import 'package:prometh_ai/theme.dart';
import 'package:prometh_ai/widget/aicon_button.dart';
import 'package:prometh_ai/widget/svg_button.dart';

class ReloadButton extends StatelessWidget {
  final VoidCallback onStop;
  final VoidCallback onDone;
  final VoidCallback? onReload;
  final RecordState recordState;
  final bool isEditing;

  const ReloadButton({
    super.key,
    required this.onStop,
    required this.onReload,
    required this.onDone,
    required this.recordState,
    required this.isEditing,
  });

  Widget _buildContent(BuildContext context) {
    if (isEditing) {
      return AIconButton(
        onPressed: onDone,
        icon: Icons.check_circle,
        color: C.grey,
        size: 32,
        iconSize: 24,
      );
    }
    switch (recordState) {
      case RecordState.idle:
        return Opacity(
          opacity: onReload == null ? 0.3 : 1,
          child: SVGButton(
            onPressed: onReload,
            icon: 'assets/svgs/reload.svg.vec',
            color: C.grey,
            iconSize: 24,
            size: 44,
          ),
        );
      case RecordState.loading:
        return const SizedBox();
      case RecordState.recording:
        return AIconButton(
          onPressed: onStop,
          icon: Icons.stop,
          color: C.grey,
          size: 32,
          iconSize: 24,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: 44, height: 44, child: Center(child: _buildContent(context)));
  }
}
