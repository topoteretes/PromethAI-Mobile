import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

import 'retry_options.dart';

/// An interceptor that will try to send failed request again
class RetryInterceptor extends Interceptor {
  final Dio dio;
  final Logger? logger;
  final RetryOptions options;

  RetryInterceptor({required this.dio, this.logger, this.options = const RetryOptions()});

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final options = err.requestOptions;
    var extra = RetryOptions.fromExtra(options, this.options);

    var shouldRetry = extra.retries > 0 && await extra.retryEvaluator(err);
    if (shouldRetry) {
      if (extra.retryInterval.inMilliseconds > 0) {
        await Future.delayed(extra.retryInterval);
      }

      // Update options to decrease retry count before new try
      extra = extra.copyWith(retries: extra.retries - 1);
      options.extra = options.extra..addAll(extra.toExtra());

      try {
        logger?.w(
            "[${options.uri}] An error occured during request, trying a again (remaining tries: ${extra.retries}, error: ${err.error})");
        // We retry with the updated options
        await dio.request(
          options.path,
          cancelToken: options.cancelToken,
          data: options.data,
          onReceiveProgress: options.onReceiveProgress,
          onSendProgress: options.onSendProgress,
          queryParameters: options.queryParameters,
          options: options as Options,
        );
      } catch (e) {
        return super.onError(err, handler);
      }
    }

    return super.onError(err, handler);
  }
}
