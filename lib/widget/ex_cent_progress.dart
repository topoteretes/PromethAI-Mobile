import 'package:flutter/widgets.dart';

import 'progress.dart';

class ExCentProgress extends StatelessWidget {
  final bool inverted;

  const ExCentProgress({super.key, this.inverted = false});

  @override
  Widget build(BuildContext context) => Expanded(child: Center(child: Progress(inverted: inverted)));
}
