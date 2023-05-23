import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/state/path.dart';
import 'package:prometh_ai/utils/logger.dart';

ValueNotifier<List<String>> usePath(WidgetRef ref, int pathTop) {
  final fullPath = ref.watch(PathNotifier.provider);
  final previousFullPath = usePrevious(fullPath);
  final path = useState(<String>[]);

  useEffect(() {
    L.d("----->pathTop: ${pathTop}");
    path.value = (fullPath.length < pathTop ? (previousFullPath ?? []) : fullPath).sublist(0, pathTop);
    return null;
  }, [fullPath, previousFullPath, pathTop]);

  return path;
}
