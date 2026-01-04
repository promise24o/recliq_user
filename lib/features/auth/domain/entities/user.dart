import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    @JsonKey(name: 'phone') String? phoneNumber,
    String? email,
    String? name,
    String? role,
    @Default(false) bool isVerified,
    @Default(false) bool hasPin,
    @Default(0.0) double walletBalance,
    String? profilePhoto,
    String? referralCode,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
