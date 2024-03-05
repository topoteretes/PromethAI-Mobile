import 'package:dio/dio.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'api_error.dart';
import 'api_result.dart';
import 'package:prometh_ai/env/.env.dart';

extension DioExtensions on Dio {
  Future<T> safePost<T>(
    String path,
    T Function(Map<String, dynamic>) mapper, {
    data,
    ref,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUri = false,
    bool rawResponse = false,
  }) async {
    late Response<Map<String, dynamic>> response;
    try {
      L.d("safe.POST.request: ${stringify(data)}");

      response = isUri
          ? await postUri(
              Uri.parse(path),
              data: data,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
            )
          : await post(
              path,
              data: data,
              options: options,
              cancelToken: cancelToken,
              onSendProgress: onSendProgress,
              onReceiveProgress: onReceiveProgress,
            );

      longDebug("safe.POST.response: $response");

      final parsedResult = ApiResult.fromResponse(response, mapper, rawResponse: rawResponse);
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
    } catch (e) {
      final errorNotifier = ref?.read(ErrorNotifier.provider.notifier);
      final message = [
        "JSON Parser error: ${e.toString()}",
        "HTTP POST '${Environment.apiURL}$path'",
        "POST body: '${stringify(data)}'",
        "POST response: '${stringify(response.data)}'",
      ];
      errorNotifier?.store(message.join("\n\n"));
      throw ApiError(code: -1000, message: e.toString());
    }
  }

  Future<T> safeGet<T>(
    String path,
    T Function(Map<String, dynamic>) mapper, {
    data,
    ref,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool isUri = false,
    bool rawResponse = false,
  }) async {
    try {
      L.d("safe.GET.request: $path");

      final response = isUri
          ? await get(
              path,
              data: data,
              options: options,
              onReceiveProgress: onReceiveProgress,
            )
          : await getUri(
              Uri.parse(path),
              data: data,
              options: options,
              onReceiveProgress: onReceiveProgress,
            );

      L.d("safe.GET.response: $response");

      final parsedResult = ApiResult.fromResponse(response, mapper, rawResponse: rawResponse);

      if (parsedResult is Success<T>) {
        return parsedResult.data;
      } else if (parsedResult is Failed<T>) {
        throw parsedResult.errors;
      }
      throw "Unknown Error";
    } on DioError catch (exception) {
      L.d("----->exception: $exception");
      final errorMessage = exception.message ?? "N/A";
      final code = exception.response?.statusCode;
      if (errorMessage != 'The request was cancelled.') {
        final message = [
          "HTTP GET '${Environment.apiURL}$path' failed with error code: $code.",
          "Error message: '$errorMessage'",
          "GET query-params: '${stringify(data)}'",
        ];
        ref?.read(ErrorNotifier.provider.notifier).store(message.join("\n\n"));
      }
      throw ApiError(code: code, message: errorMessage);
    }
  }
}
