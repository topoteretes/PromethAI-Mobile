import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'selected_journey.dart';

final sessionId = Provider((ref) => ref.watch(SelectedJourneyNotifier.provider).created.toString());
