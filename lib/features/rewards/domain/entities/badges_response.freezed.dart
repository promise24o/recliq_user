// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'badges_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BadgesResponse _$BadgesResponseFromJson(Map<String, dynamic> json) {
  return _BadgesResponse.fromJson(json);
}

/// @nodoc
mixin _$BadgesResponse {
  int get totalBadges => throw _privateConstructorUsedError;
  List<Badge> get earnedBadges => throw _privateConstructorUsedError;
  List<Badge> get lockedBadges => throw _privateConstructorUsedError;

  /// Serializes this BadgesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BadgesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BadgesResponseCopyWith<BadgesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BadgesResponseCopyWith<$Res> {
  factory $BadgesResponseCopyWith(
          BadgesResponse value, $Res Function(BadgesResponse) then) =
      _$BadgesResponseCopyWithImpl<$Res, BadgesResponse>;
  @useResult
  $Res call(
      {int totalBadges, List<Badge> earnedBadges, List<Badge> lockedBadges});
}

/// @nodoc
class _$BadgesResponseCopyWithImpl<$Res, $Val extends BadgesResponse>
    implements $BadgesResponseCopyWith<$Res> {
  _$BadgesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BadgesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBadges = null,
    Object? earnedBadges = null,
    Object? lockedBadges = null,
  }) {
    return _then(_value.copyWith(
      totalBadges: null == totalBadges
          ? _value.totalBadges
          : totalBadges // ignore: cast_nullable_to_non_nullable
              as int,
      earnedBadges: null == earnedBadges
          ? _value.earnedBadges
          : earnedBadges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
      lockedBadges: null == lockedBadges
          ? _value.lockedBadges
          : lockedBadges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BadgesResponseImplCopyWith<$Res>
    implements $BadgesResponseCopyWith<$Res> {
  factory _$$BadgesResponseImplCopyWith(_$BadgesResponseImpl value,
          $Res Function(_$BadgesResponseImpl) then) =
      __$$BadgesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalBadges, List<Badge> earnedBadges, List<Badge> lockedBadges});
}

/// @nodoc
class __$$BadgesResponseImplCopyWithImpl<$Res>
    extends _$BadgesResponseCopyWithImpl<$Res, _$BadgesResponseImpl>
    implements _$$BadgesResponseImplCopyWith<$Res> {
  __$$BadgesResponseImplCopyWithImpl(
      _$BadgesResponseImpl _value, $Res Function(_$BadgesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of BadgesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBadges = null,
    Object? earnedBadges = null,
    Object? lockedBadges = null,
  }) {
    return _then(_$BadgesResponseImpl(
      totalBadges: null == totalBadges
          ? _value.totalBadges
          : totalBadges // ignore: cast_nullable_to_non_nullable
              as int,
      earnedBadges: null == earnedBadges
          ? _value._earnedBadges
          : earnedBadges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
      lockedBadges: null == lockedBadges
          ? _value._lockedBadges
          : lockedBadges // ignore: cast_nullable_to_non_nullable
              as List<Badge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BadgesResponseImpl implements _BadgesResponse {
  const _$BadgesResponseImpl(
      {required this.totalBadges,
      required final List<Badge> earnedBadges,
      required final List<Badge> lockedBadges})
      : _earnedBadges = earnedBadges,
        _lockedBadges = lockedBadges;

  factory _$BadgesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BadgesResponseImplFromJson(json);

  @override
  final int totalBadges;
  final List<Badge> _earnedBadges;
  @override
  List<Badge> get earnedBadges {
    if (_earnedBadges is EqualUnmodifiableListView) return _earnedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_earnedBadges);
  }

  final List<Badge> _lockedBadges;
  @override
  List<Badge> get lockedBadges {
    if (_lockedBadges is EqualUnmodifiableListView) return _lockedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lockedBadges);
  }

  @override
  String toString() {
    return 'BadgesResponse(totalBadges: $totalBadges, earnedBadges: $earnedBadges, lockedBadges: $lockedBadges)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BadgesResponseImpl &&
            (identical(other.totalBadges, totalBadges) ||
                other.totalBadges == totalBadges) &&
            const DeepCollectionEquality()
                .equals(other._earnedBadges, _earnedBadges) &&
            const DeepCollectionEquality()
                .equals(other._lockedBadges, _lockedBadges));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalBadges,
      const DeepCollectionEquality().hash(_earnedBadges),
      const DeepCollectionEquality().hash(_lockedBadges));

  /// Create a copy of BadgesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BadgesResponseImplCopyWith<_$BadgesResponseImpl> get copyWith =>
      __$$BadgesResponseImplCopyWithImpl<_$BadgesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BadgesResponseImplToJson(
      this,
    );
  }
}

abstract class _BadgesResponse implements BadgesResponse {
  const factory _BadgesResponse(
      {required final int totalBadges,
      required final List<Badge> earnedBadges,
      required final List<Badge> lockedBadges}) = _$BadgesResponseImpl;

  factory _BadgesResponse.fromJson(Map<String, dynamic> json) =
      _$BadgesResponseImpl.fromJson;

  @override
  int get totalBadges;
  @override
  List<Badge> get earnedBadges;
  @override
  List<Badge> get lockedBadges;

  /// Create a copy of BadgesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BadgesResponseImplCopyWith<_$BadgesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
