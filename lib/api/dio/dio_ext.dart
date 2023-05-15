import 'package:dio/dio.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'api_error.dart';
import 'api_result.dart';
import 'package:prometh_ai/env/.env.dart';

extension DioExtensions on Dio {
  Future<T> safePost<T>(String path, T Function(Map<String, dynamic>) mapper,
      {data,
      Map<String, dynamic>? queryParameters,
      ref,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress}) async {
    try {
      L.d("safe.request: ${stringify(data)}");

      final response = await post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      L.d("safe.response: $response");

      final parsedResult = ApiResult.fromResponse(response, mapper);
      if (parsedResult is Success<T>) {
        return parsedResult.data;
      } else if (parsedResult is Failed<T>) {
        throw parsedResult.errors;
      }
      throw "Unknown Error";
    } on DioError catch (exception) {
      final errorMessage = exception.message ?? "N/A";
      final code = exception.response?.statusCode;
      if (errorMessage != 'The request was cancelled.') {
        final message = [
          "HTTP POST '${Environment.apiURL}$path' failed with error code: $code.",
          "Error message: '$errorMessage'",
          "POST body: '${stringify(data)}'",
        ];
        ref?.read(ErrorNotifier.provider.notifier).store(message.join("\n\n"));
      }
      throw ApiError(code: code, message: errorMessage);
    }
  }
}
