import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:prometh_ai/settings.dart';
import 'package:sound_stream/sound_stream.dart';
import 'package:web_socket_channel/io.dart';

enum RecordState { idle, loading, recording }

class RecordStateNotifier extends StateNotifier<RecordState> {
  final Ref ref;
  static final provider = StateNotifierProvider<RecordStateNotifier, RecordState>(RecordStateNotifier.new);

  RecordStateNotifier(this.ref) : super(RecordState.idle);

  loading() => state = RecordState.loading;
  idle() => state = RecordState.idle;
  recording() => state = RecordState.recording;
}

class DeepgramNotifier extends StateNotifier<String> {
  RecorderStream? recorder;
  IOWebSocketChannel? channel;
  StreamSubscription? recorderStatus;
  StreamSubscription? audioStream;

  final Ref ref;
  static final provider = StateNotifierProvider<DeepgramNotifier, String>(DeepgramNotifier.new);

  DeepgramNotifier(this.ref) : super("");

  startRecord(String initialValue) async {
    final recordStateNotifier = ref.read(RecordStateNotifier.provider.notifier);
    state = initialValue;

    recordStateNotifier.loading();
    final permissionStatus = await Permission.microphone.request(); /**/
    if (![PermissionStatus.granted, PermissionStatus.limited].contains(permissionStatus)) {
      return;
    }
    await _initStream();
    await recorder?.start();
    recordStateNotifier.recording();
  }

  stopRecord([bool reset = false]) async {
    final recordStateNotifier = ref.read(RecordStateNotifier.provider.notifier);
    await recorder?.stop();
    recordStateNotifier.idle();
    if (reset) {
      state = "";
    }
  }

  _initStream() async {
    if (recorder != null) {
      return;
    }
    recorder = RecorderStream();
    channel = IOWebSocketChannel.connect(
      Uri.parse(S.deepgramURL),
      headers: {'Authorization': 'Token ${S.deepgramApiKey}'},
    );

    channel?.stream.listen((event) async {
      final words = _getWords(event);
      if (words != "") {
        state = "$state $words";
      }
    });

    audioStream = recorder?.audioStream.listen(channel?.sink.add);

    await recorder?.initialize();
  }

  _getWords(event) {
    final parsedJson = jsonDecode(event);
    try {
      final words = parsedJson['channel']['alternatives'][0]['transcript'] as String;
      return words;
    } catch (e) {
      recorderStatus?.cancel();
      audioStream?.cancel();
      channel?.sink.close();
      recorder?.dispose();
      recorder = null;
    }
    return "";
  }

  update(String value) => state = value;
}
