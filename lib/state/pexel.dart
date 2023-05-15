import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pexels_api/pexels_api.dart';
import 'package:prometh_ai/model/pexel_params.dart';

final _pexel = Provider((ref) => PexelsClient("hMuPCHer5ERWCDKOBx9GyHPXBviJ0ZeFnAmUxD0T3e7zK4kM4SiLWpq6"));

final getPhotoAPI = FutureProvider.autoDispose.family<String?, PexelParams>((ref, param) async {
  final result = await ref
      .watch(_pexel)
      .searchPhotos(param.query, collection: PexelsCollection.Regular, orientation: PexelsPhotoOrientation.landscape);
  return result?.items.firstOrNull?.sources[param.size]?.link;
});
