import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pexels_api/pexels_api.dart';
import 'package:prometh_ai/model/pexel_params.dart';

final _pexel = Provider((ref) => PexelsClient("hMuPCHer5ERWCDKOBx9GyHPXBviJ0ZeFnAmUxD0T3e7zK4kM4SiLWpq6"));

final _imageUrlCache = <String, String>{};

final getPhotoAPI = FutureProvider.autoDispose.family<String?, PexelParams>((ref, param) async {
  final cacheKey = "${param.query}#${param.size}";
  final cachedURL = _imageUrlCache[cacheKey];
  if (cachedURL != null) {
    return cachedURL;
  }

  final result =
      await ref.read(_pexel).searchPhotos(param.query, collection: PexelsCollection.Regular, orientation: PexelsPhotoOrientation.landscape);
  final resultURL = result?.items.firstOrNull?.sources[param.size]?.link;
  if (resultURL != null) {
    _imageUrlCache[cacheKey] = resultURL;
  }
  return resultURL;
});
