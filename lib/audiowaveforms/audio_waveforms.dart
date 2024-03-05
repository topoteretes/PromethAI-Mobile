import 'package:flutter/material.dart';
import 'package:prometh_ai/audiowaveforms/painters/recorder_wave_painter.dart';

import 'base/utils.dart';
import 'base/wave_style.dart';
import 'controllers/recorder_controller.dart';

class AudioWaveforms extends StatefulWidget {
  final Size size;
  final RecorderController recorderController;
  final WaveStyle waveStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxDecoration? decoration;
  final Color? backgroundColor;
  final bool shouldCalculateScrolledPosition;

  const AudioWaveforms({
    Key? key,
    required this.size,
    required this.recorderController,
    this.waveStyle = const WaveStyle(),
    this.padding,
    this.margin,
    this.decoration,
    this.backgroundColor,
    this.shouldCalculateScrolledPosition = true,
  }) : super(key: key);

  @override
  State<AudioWaveforms> createState() => _AudioWaveformsState();
}

class _AudioWaveformsState extends State<AudioWaveforms> {
  double _initialPosition = 0.0;

  @override
  void initState() {
    super.initState();
    widget.recorderController.addListener(() {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    widget.recorderController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
        padding: widget.padding,
        margin: widget.margin,
        color: widget.backgroundColor,
        decoration: widget.decoration,
        child: ClipPath(
          child: RepaintBoundary(
            child: CustomPaint(
              size: widget.size,
              painter: RecorderWavePainter(
                waveThickness: widget.waveStyle.waveThickness,
                waveData: widget.recorderController.waveData,
                callPushback: widget.recorderController.shouldRefresh,
                spacing: widget.waveStyle.spacing,
                waveColor: widget.waveStyle.waveColor,
                totalBackDistance: widget.recorderController.totalBackDistance,
                pushBack: _pushBackWave,
                initialPosition: _initialPosition,
                extendWaveform: widget.waveStyle.extendWaveform,
                updateFrequency: const Duration(seconds: 1).inMilliseconds / RecorderController.updateFrequency.inMilliseconds,
                setCurrentPositionDuration: widget.recorderController.setScrolledPositionDuration,
                shouldCalculateScrolledPosition: widget.shouldCalculateScrolledPosition,
                scaleFactor: widget.waveStyle.scaleFactor,
              ),
            ),
          ),
        ),
      );

  ///This will also handle refreshing the wave after scrolled
  void _pushBackWave() {
    _initialPosition = 0.0;
    widget.recorderController.totalBackDistance = widget.recorderController.totalBackDistance + Offset(widget.waveStyle.spacing, 0.0);
    ambiguate(WidgetsBinding.instance)?.addPostFrameCallback((_) {
      setState(() {});
    });
  }
}
