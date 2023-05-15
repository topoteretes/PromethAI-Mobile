import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';

final L = Logger(
    printer: PrettyPrinter(
      methodCount: 1,
      // number of method calls to be displayed
      errorMethodCount: 8,
      // number of method calls if stacktrace is provided
      lineLength: 120,
      // width of the output
      colors: true,
      // Colorful log messages
      printEmojis: true,
      // Print an emoji for each log message
      printTime: true, // Should each log print contain a timestamp
    ),
    //level: Platform.environment.containsKey('FLUTTER_TEST') ? Level.error : Level.debug);
    level: Level.debug);

String stringify(jsonObject) {
  const encoder = JsonEncoder.withIndent("     ");
  return encoder.convert(jsonObject);
}

longDebug(String content) => debugPrint(stringify(json), wrapWidth: 128);
