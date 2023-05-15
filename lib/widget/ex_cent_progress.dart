import 'package:flutter/widgets.dart';

import 'progress.dart';

class ExCentProgress extends StatelessWidget {
  const ExCentProgress({super.key});

  @override
  Widget build(BuildContext context) => const Expanded(child: Center(child: Progress()));
}
