import 'dart:ui';

afterDelay(Duration delay, VoidCallback action) => Future.delayed(delay).then((_) => action());
