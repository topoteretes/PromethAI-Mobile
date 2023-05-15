import 'package:freezed_annotation/freezed_annotation.dart';

part 'name_amount.freezed.dart';
part 'name_amount.g.dart';

@freezed
class NameAmount with _$NameAmount {
  const factory NameAmount({
    required String name,
    required int amount,
  }) = _NameAmount;

  factory NameAmount.fromJson(Map<String, dynamic> json) => _$NameAmountFromJson(json);
}
