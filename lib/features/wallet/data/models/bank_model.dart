import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/bank.dart';

part 'bank_model.g.dart';
part 'bank_model.freezed.dart';

@freezed
class BankModel with _$BankModel {
  const factory BankModel({
    required int id,
    required String name,
    required String slug,
    required String code,
    required String longcode,
    @JsonKey(defaultValue: 'Nigeria') required String country,
    @JsonKey(defaultValue: 'NGN') required String currency,
    @JsonKey(defaultValue: 'nuban') required String type,
    @Default(false) bool payWithBank,
    @Default(true) bool supportsTransfer,
    @Default(false) bool availableForDirectDebit,
    @Default(true) bool active,
    @Default(false) bool isDeleted,
    @JsonKey(name: 'createdAt') DateTime? createdAt,
    @JsonKey(name: 'updatedAt') DateTime? updatedAt,
  }) = _BankModel;

  factory BankModel.fromJson(Map<String, dynamic> json) =>
      _$BankModelFromJson(json);

  const BankModel._();

  Bank toDomain() => Bank(
        id: id,
        name: name,
        slug: slug,
        code: code,
        longcode: longcode,
        country: country,
        currency: currency,
        type: type,
        payWithBank: payWithBank,
        supportsTransfer: supportsTransfer,
        availableForDirectDebit: availableForDirectDebit,
        active: active,
        isDeleted: isDeleted,
        createdAt: createdAt,
        updatedAt: updatedAt,
      );
}

@freezed
class BankListResponse with _$BankListResponse {
  const factory BankListResponse({
    required List<BankModel> banks,
  }) = _BankListResponse;

  factory BankListResponse.fromJson(Map<String, dynamic> json) =>
      _$BankListResponseFromJson(json);
}
