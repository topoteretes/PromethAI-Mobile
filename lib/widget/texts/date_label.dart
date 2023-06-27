import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../theme_selectors.dart';

final _formatter = DateFormat('yyyy.MM.dd HH:mm:ss');

class DateLabel extends StatelessWidget {
  final int timestamp;
  const DateLabel({super.key, required this.timestamp});

  @override
  Widget build(BuildContext context) => Text(
        _formatter.format(DateTime.fromMillisecondsSinceEpoch(timestamp)),
        style: tt(context).displaySmall,
      );
}
