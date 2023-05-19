class A {
  static var fast = const Duration(milliseconds: 300);
  static var normal = const Duration(milliseconds: 600);
  static var slow = const Duration(milliseconds: 1200);
}

class S {
  static const normal = 16.0;
}

class M {
  static const large = 24.0;
  static const normal = 16.0;
  static const small = normal / 2;
  static const tiny = small / 2;
}

class R {
  static const xxx = 32.0;
  static const huge = 24.0;
  static const big = 16.0;
  static const normal = 8.0;
  static const small = normal / 2;
  static const tiny = small / 2;
}
