import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';

const _maxPeak = 32786.0;

class RecorderController extends ChangeNotifier {
  static const updateFrequency = Duration(milliseconds: 100);
  static const sampleRate = 44100;

  final List<double> waveData = [];
  final bytesBuilder = BytesBuilder();
  bool isRecording = false;
  bool shouldRefresh = true;
  Duration elapsedDuration = Duration.zero;
  Duration recordedDuration = Duration.zero;
  Offset totalBackDistance = Offset.zero;

  Timer? _timer;
  bool _isDisposed = false;
  Timer? _recorderTimer;

  final ValueNotifier<int> currentScrolledDuration = ValueNotifier(0);
  final StreamController<Duration> _currentDurationController = StreamController.broadcast();

  /// A stream to get current duration of currently recording audio file.
  /// Events are emitted every 50 milliseconds which means current duration is
  /// accurate to 50 milliseconds. To get Fully accurate duration use
  /// [recordedDuration] after stopping the recording.
  Stream<Duration> get onCurrentDuration => _currentDurationController.stream;

  final StreamController<Duration> _recordedFileDurationController = StreamController.broadcast();

  /// A stream to get duration of recording when audio recorder has
  /// been stopped. Events are only emitted if platform could extract the
  /// duration of audio file when recording is ended.
  Stream<Duration> get onRecordingEnded => _recordedFileDurationController.stream;

  Future<void> start() async {
    waveData.clear();
    currentScrolledDuration.value = 0;
    if (!isRecording) {
      isRecording = true;
      _startTimer();
      notifyListeners();
      return;
    }
  }

  Future<String?> stop() async {
    isRecording = false;
    _timer?.cancel();
    _recorderTimer?.cancel();
    reset();

    notifyListeners();
    return null;
  }

  void reset() {
    refresh();
    notifyListeners();
  }

  void _startTimer() {
    recordedDuration = Duration.zero;
    totalBackDistance = Offset.zero;
    const duration = Duration(milliseconds: 50);
    _recorderTimer = Timer.periodic(duration, (_) {
      elapsedDuration += duration;
      _currentDurationController.add(elapsedDuration);
    });

    _timer = Timer.periodic(
      updateFrequency,
      (timer) async {
        var chunk = bytesBuilder.toBytes().buffer.asInt16List();

        double sum = 0;
        int renderSpacing = 800;
        int otherindex = 0;

        for (int s = 0; s < chunk.length; s += 8) {
          sum += 2 * chunk[s].abs() / _maxPeak;
          otherindex += 8;
          if (otherindex > renderSpacing) {
            waveData.add(sum);
            sum = 0;
            otherindex = 0;
          }
        }

        bytesBuilder.clear();

        notifyListeners();
      },
    );
  }

  void refresh() {
    shouldRefresh = true;
    notifyListeners();
  }

  void setRefresh(bool refresh) {
    shouldRefresh = refresh;
    notifyListeners();
  }

  void setScrolledPositionDuration(int duration) {
    currentScrolledDuration.value = duration;
  }

  @override
  void notifyListeners() {
    if (_isDisposed) return;
    super.notifyListeners();
  }

  @override
  void dispose() async {
    currentScrolledDuration.dispose();
    _currentDurationController.close();
    _recordedFileDurationController.close();
    _recorderTimer?.cancel();
    _timer?.cancel();
    _timer = null;
    _recorderTimer = null;
    _isDisposed = true;
    super.dispose();
  }

  void add(Uint8List event) => bytesBuilder.add(event);
}
