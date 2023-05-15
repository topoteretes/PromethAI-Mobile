import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/utils/dio/dio_debug.dart';

import '../env/.env.dart';

BaseOptions _options = BaseOptions(
  baseUrl: Environment.apiURL,
  connectTimeout: const Duration(seconds: 15),
  receiveTimeout: const Duration(seconds: 120),
);

final dio = Provider((ref) => addInterceptors(Dio(_options)));
