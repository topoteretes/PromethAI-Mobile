import 'package:hydrated_riverpod/hydrated_riverpod.dart';

class ThumbnailNotifier extends HydratedStateNotifier<Map<String, String>> {
  static const _key = 'Thumbnail';
  static final provider = StateNotifierProvider<ThumbnailNotifier, Map<String, String>>(ThumbnailNotifier.init);

  static ThumbnailNotifier init(Ref ref) => ThumbnailNotifier(ref);

  final Ref ref;

  ThumbnailNotifier(this.ref) : super({});

  @override
  Map<String, String> fromJson(Map<String, dynamic> json) => json[_key] == null ? {} : Map<String, String>.from(json[_key]);

  @override
  Map<String, dynamic> toJson(state) => {_key: state};

  store(String prompt, String url) => state = {...state, prompt: url};
}
