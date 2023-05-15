import 'package:flutter/foundation.dart';
import 'package:hydrated_riverpod/hydrated_riverpod.dart';
import 'package:path_provider/path_provider.dart';

Future<void> initStore() async {
  final storageDirectory = kIsWeb ? HydratedStorage.webStorageDirectory : await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: storageDirectory);
  HydratedRiverpod.initialize(storage: storage);
}
