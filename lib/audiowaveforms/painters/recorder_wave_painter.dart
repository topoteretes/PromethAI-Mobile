import 'package:flutter/material.dart';

class RecorderWavePainter extends CustomPainter {
  final List<double> waveData;
  final Color waveColor;
  final double spacing;
  final double initialPosition;
  final Offset totalBackDistance;
  final double waveThickness;
  final VoidCallback pushBack;
  final bool callPushback;
  final bool extendWaveform;
  final double updateFrequency;
  final Paint _wavePaint;
  final Function(int) setCurrentPositionDuration;
  final bool shouldCalculateScrolledPosition;
  final double scaleFactor;

  RecorderWavePainter({
    required this.waveData,
    required this.waveColor,
    required this.spacing,
    required this.initialPosition,
    required this.totalBackDistance,
    required this.waveThickness,
    required this.pushBack,
    required this.callPushback,
    required this.extendWaveform,
    required this.updateFrequency,
    required this.setCurrentPositionDuration,
    required this.shouldCalculateScrolledPosition,
    required this.scaleFactor,
  }) : _wavePaint = Paint()
          ..color = waveColor
          ..strokeWidth = waveThickness
          ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    for (var i = 0; i < waveData.length; i++) {
      if (((spacing * i) + spacing > size.width / (extendWaveform ? 1 : 2) + totalBackDistance.dx) && callPushback) {
        pushBack();
      }

      _drawUpperWave(canvas, size, i);
      _drawLowerWave(canvas, size, i);
    }

    ///calculates scrolled position with respect to duration
    if (shouldCalculateScrolledPosition) _setScrolledDuration(size);
  }

  @override
  bool shouldRepaint(RecorderWavePainter oldDelegate) => true;

  _drawUpperWave(Canvas canvas, Size size, int i) => canvas.drawLine(
      Offset(-totalBackDistance.dx + (spacing * i) - initialPosition, size.height / 2),
      Offset(-totalBackDistance.dx + (spacing * i) - initialPosition, -(waveData[i] * scaleFactor) + size.height / 2),
      _wavePaint);

  _drawLowerWave(Canvas canvas, Size size, int i) => canvas.drawLine(
      Offset(-totalBackDistance.dx + (spacing * i) - initialPosition, size.height / 2),
      Offset(-totalBackDistance.dx + (spacing * i) - initialPosition, (waveData[i] * scaleFactor) + size.height / 2),
      _wavePaint);

  _setScrolledDuration(Size size) =>
      setCurrentPositionDuration((((-totalBackDistance.dx + (size.width / 2)) / (spacing * updateFrequency)) * 1000).abs().toInt());
}
