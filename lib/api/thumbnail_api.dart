import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prometh_ai/api/dio/dio_ext.dart';
import 'package:prometh_ai/env/.env.dart';
import 'package:prometh_ai/model/prompt_input.dart';
import 'package:prometh_ai/model/replicate_request.dart';
import 'package:prometh_ai/model/replicate_response.dart';
import 'package:prometh_ai/state/error.dart';
import 'package:prometh_ai/state/thumbnail.dart';
import 'package:prometh_ai/utils/logger.dart';

import 'api.dart';

/*
curl -s -X POST \
-d '{"version": "db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf", "input": {"prompt": "a vision of paradise. unreal engine"}}' \
-H "Authorization: Token r8_dsbLsA3RvNJKtbb2DEdHWlPRLemm2QB2KRPEQ" \
-H 'Content-Type: application/json' \
"https://api.replicate.com/v1/predictions" | jq

curl -s -H "Authorization: Token r8_T8uESXrcvi4fIBzdTF3y6OK0Yzftm2O46SDLn" \
-H 'Content-Type: application/json' \
"https://api.replicate.com/v1/predictions/wgcsk7bbeqwjmdfxkmewhhy4by" | jq "{id, input, output, status}"
*/

_formatPrompt(String prompt) =>
    "Close-up of a recipe: $prompt, in a luxurious Michelin kitchen style, studio lighting, depth of field, ultra-detailed.";

final thumbnailAPI = FutureProvider.autoDispose.family<String, String>((ref, prompt) async {
  final thumbnailCache = ref.read(ThumbnailNotifier.provider);
  if (thumbnailCache.containsKey(prompt)) {
    return thumbnailCache[prompt]!;
  }
  final payload = ReplicateRequest(
      version: Environment.replicateModelVersion,
      input: PromptInput(
        prompt: _formatPrompt(prompt),
        width: 768,
        height: 768,
        scheduler: "K_EULER_ANCESTRAL",
        numInferenceSteps: 16,
      ));

  final dioClient = ref.read(dio);
  try {
    var result = await dioClient.safePost('https://api.replicate.com/v1/predictions', ReplicateResponse.fromJson,
        data: payload.toJson(),
        options: Options(
          headers: {
            "Authorization": "Token ${Environment.replicateApiKey}",
            "Content-Type": "application/json",
          },
          responseDecoder: gzipMaybeDecoder,
        ),
        ref: ref,
        isUri: true,
        rawResponse: true);

    while (result.status != "succeeded" || (result.output?.isEmpty ?? true)) {
      await Future.delayed(const Duration(milliseconds: 1000));
      result = await dioClient.safeGet(result.urls.get, ReplicateResponse.fromJson,
          options: Options(
            headers: {
              "Authorization": "Token ${Environment.replicateApiKey}",
              "Content-Type": "application/json",
            },
            responseDecoder: gzipMaybeDecoder,
          ),
          isUri: true,
          rawResponse: true);
    }
    final url = result.output!.first;
    final thumbnailNotifier = ref.read(ThumbnailNotifier.provider.notifier);
    thumbnailNotifier.store(prompt, url);
    return url;
  } catch (e) {
    ref.read(ErrorNotifier.provider.notifier).store(e.toString());
    rethrow;
  }
});

String? gzipMaybeDecoder(responseBytes, RequestOptions options, responseBody) {
  try {
    return utf8.decode(GZipCodec().decode(responseBytes));
  } catch (e) {
    L.e("----->gzipMaybeDecoder.error: $e");
  }
  return utf8.decode(responseBytes);
}
