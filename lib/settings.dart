import 'package:flutter/widgets.dart';

class A {
  static var fast = const Duration(milliseconds: 300);
  static var normal = const Duration(milliseconds: 600);
  static var slow = const Duration(milliseconds: 1200);
}

class S {
  static const normal = 16.0;
  static const deepgramURL = 'wss://api.deepgram.com/v1/listen?encoding=linear16&sample_rate=16000&language=en-GB&model=nova';
  static const deepgramApiKey = '45936a44402c7e5cf730897807c3368684b1a43c';
}

class M {
  static const large = 24.0;
  static const normal = 16.0;
  static const small = normal / 2;
  static const tiny = small / 2;
}

class CV {
  static const normal = Curves.easeInOut;
}

class R {
  static const xxx = 32.0;
  static const huge = 24.0;
  static const big = 16.0;
  static const normal = 8.0;
  static const small = normal / 2;
  static const tiny = small / 2;
}
