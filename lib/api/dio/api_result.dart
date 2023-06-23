import 'package:dio/dio.dart';

import 'api_error.dart';

abstract class ApiResult<T> {
  static const String _jsonNodeData = "response";
  static const String _jsonNodeErrors = "errors";

  static ApiResult<T> fromResponse<T>(Response response, T Function(Map<String, dynamic>) mapper, {bool rawResponse = false}) {
    final responseData = response.data;
    if (rawResponse) {
      return Success(mapper(response.data));
    }

    if (responseData[_jsonNodeErrors] != null) {
      return ServerError.fromResponse(response);
    } else if (responseData[_jsonNodeData] != null) {
      return Success(mapper(response.data[_jsonNodeData]));
    } else {
      return InternalError();
    }
  }
}

class Success<T> extends ApiResult<T> {
  final T data;

  Success(this.data);
}

class Failed<T> extends ApiResult<T> {
  List<ApiError> errors;

  Failed(this.errors);
}

class ServerError<T> extends Failed<T> {
  static const String _jsonNodeErrors = "errors";

  ServerError(List<ApiError> errors) : super(errors);

  static ServerError<T> fromResponse<T>(Response response) {
    return ServerError((response.data[_jsonNodeErrors] as List).map((e) => ApiError.fromJson(e)).toList());
  }
}

class NetworkError<T> extends Failed<T> {
  NetworkError(List<ApiError> errors) : super(errors);
}

class InternalError<T> extends Failed<T> {
  InternalError() : super(List.empty());
}
