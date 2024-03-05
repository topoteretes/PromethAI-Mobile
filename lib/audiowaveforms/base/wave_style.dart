import 'package:flutter/material.dart';

class WaveStyle {
  /// Color of the [Wave].
  final Color waveColor;

  /// Whether to show line in the middle defaults to true
  final bool showMiddleLine;

  /// Space between each wave
  final double spacing;

  /// Width of each wave
  final double waveThickness;

  /// Extend the wave to the end of size.width, default is size.width/2
  final bool extendWaveform;

  /// Default normalised amplitude/power we have are between 0.0 and 1.0.
  /// So scale them, [scaleFactor] can be used. Defaults to 20.0.
  final double scaleFactor;

  /// A model class to provide style to the waveforms.
  const WaveStyle({
    this.waveColor = Colors.blueGrey,
    this.showMiddleLine = true,
    this.spacing = 8.0,
    this.waveThickness = 3.0,
    this.extendWaveform = false,
    this.scaleFactor = 20.0,
  }) : assert(waveThickness < spacing, "waveThickness can't be greater than spacing");
}
