import 'dart:async';

import 'package:dio/dio.dart';

typedef RetryEvaluator = FutureOr<bool> Function(DioError error);

class RetryOptions {
  static const extraKey = "cache_retry_request";

  /// Evaluating if a retry is necessary.regarding the error.
  ///
  /// It can be a good candidate for additional operations too, like
  /// updating authentication token in case of a unauthorized error (be careful
  /// with concurrency though).
  ///
  /// Defaults to [defaultRetryEvaluator].
  final RetryEvaluator retryEvaluator;
  final int retries;
  final Duration retryInterval;

  const RetryOptions({this.retries = 3, this.retryEvaluator = defaultRetryEvaluator, this.retryInterval = const Duration(seconds: 1)});
  factory RetryOptions.noRetry() => const RetryOptions(retries: 0);

  /// Returns [true] only if the response hasn't been cancelled or got
  /// a bad status code.
  static FutureOr<bool> defaultRetryEvaluator(DioError error) =>
      error.type != DioErrorType.cancel && error.type != DioErrorType.badResponse;

  factory RetryOptions.fromExtra(RequestOptions request, RetryOptions fallback) =>
      request.extra.containsKey(extraKey) ? request.extra[extraKey] : fallback;

  RetryOptions copyWith({
    int? retries,
    Duration? retryInterval,
  }) =>
      RetryOptions(
        retries: retries ?? this.retries,
        retryInterval: retryInterval ?? this.retryInterval,
      );

  Map<String, dynamic> toExtra() => {extraKey: this};
  Options toOptions() => Options(extra: toExtra());
  Options mergeIn(Options options) => options.copyWith(
      extra: <String, dynamic>{}
        ..addAll(options.extra ?? {})
        ..addAll(toExtra()));
}
