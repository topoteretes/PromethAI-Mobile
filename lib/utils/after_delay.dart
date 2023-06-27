import 'dart:ui';

afterDelay(Duration delay, VoidCallback action) => Future.delayed(delay).then((_) => action());

async(VoidCallback action) => () {
      afterDelay(Duration.zero, action);
      return null;
    };
