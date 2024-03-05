import 'package:flutter/widgets.dart';

class A {
  static var fast = const Duration(milliseconds: 300);
  static var normal = const Duration(milliseconds: 600);
  static var slow = const Duration(milliseconds: 1200);
}

class S {
  static const examplePrompt = "Looking for a fast, vegetarian meal under \$25, without peanuts due to allergy. Mexican cuisine.";
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
