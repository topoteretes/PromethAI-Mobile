library sound_stream;

import 'dart:async';

import 'package:flutter/services.dart';

part 'recorder_stream.dart';
part 'player_stream.dart';

const MethodChannel _methodChannel = MethodChannel('vn.casperpas.sound_stream:methods');

final _eventsStreamController = StreamController<dynamic>.broadcast();

enum SoundStreamStatus {
  unset,
  initialized,
  playing,
  stopped,
}

class SoundStream {
  static final SoundStream _instance = SoundStream._internal();
  factory SoundStream() => _instance;
  SoundStream._internal() {
    _methodChannel.setMethodCallHandler(_onMethodCall);
  }

  /// Return [RecorderStream] instance (Singleton).
  RecorderStream get recorder => RecorderStream();

  /// Return [PlayerStream] instance (Singleton).
  PlayerStream get player => PlayerStream();

  Future<dynamic> _onMethodCall(MethodCall call) async {
    switch (call.method) {
      case "platformEvent":
        _eventsStreamController.add(call.arguments);
        break;
    }
    return null;
  }
}

String _enumToString(Object o) => o.toString().split('.').last;
