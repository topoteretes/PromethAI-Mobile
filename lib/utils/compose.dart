import 'dart:ui';

compose(VoidCallback? func1, VoidCallback? func2) => () {
      func1?.call();
      func2?.call();
    };
