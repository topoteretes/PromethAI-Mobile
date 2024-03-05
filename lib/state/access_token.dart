import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/utils/logger.dart';

final accessToken = Provider((ref) {
  final value = ref.watch(AccessTokenNotifier.provider);
  return Options(headers: {"Authorization": "Bearer $value"});
});

class AccessTokenNotifier extends StateNotifier<String> {
  final Ref ref;
  static final provider = StateNotifierProvider<AccessTokenNotifier, String>(AccessTokenNotifier.new);

  AccessTokenNotifier(this.ref) : super("");

  store(String accessToken) {
    L.d("----->accessToken: $accessToken");
    return state = accessToken;
  }
}
