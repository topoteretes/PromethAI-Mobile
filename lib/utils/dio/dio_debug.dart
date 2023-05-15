import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../logger.dart';
import 'retry_interceptor.dart';
import 'retry_options.dart';

Dio addInterceptors(Dio dio) => dio
  ..interceptors.add(RetryInterceptor(
    dio: dio,
    logger: L,
    options: const RetryOptions(
      retries: 3,
      retryInterval: Duration(seconds: 2),
    ),
  ))
  ..interceptors.add(PrettyDioLogger());
//..interceptors.add(DebugInterceptor());

class DebugInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    L.d("----->onRequest: ${stringify(options.data)}");
    handler.next(options);
  }

  @override
  void onResponse(
    Response response,
    ResponseInterceptorHandler handler,
  ) {
    L.d("----->onResponse: $response");
    handler.next(response);
  }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) {
    L.d("----->onError: ${err.response?.statusCode}");
    handler.next(err);
  }
}
