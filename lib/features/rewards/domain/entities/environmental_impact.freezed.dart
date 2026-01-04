// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'environmental_impact.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EnvironmentalImpact _$EnvironmentalImpactFromJson(Map<String, dynamic> json) {
  return _EnvironmentalImpact.fromJson(json);
}

/// @nodoc
mixin _$EnvironmentalImpact {
  double get totalWasteRecycled => throw _privateConstructorUsedError;
  double get co2Saved => throw _privateConstructorUsedError;
  int get treesEquivalent => throw _privateConstructorUsedError;
  String get carbonCreditScore => throw _privateConstructorUsedError;

  /// Serializes this EnvironmentalImpact to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EnvironmentalImpact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EnvironmentalImpactCopyWith<EnvironmentalImpact> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnvironmentalImpactCopyWith<$Res> {
  factory $EnvironmentalImpactCopyWith(
          EnvironmentalImpact value, $Res Function(EnvironmentalImpact) then) =
      _$EnvironmentalImpactCopyWithImpl<$Res, EnvironmentalImpact>;
  @useResult
  $Res call(
      {double totalWasteRecycled,
      double co2Saved,
      int treesEquivalent,
      String carbonCreditScore});
}

/// @nodoc
class _$EnvironmentalImpactCopyWithImpl<$Res, $Val extends EnvironmentalImpact>
    implements $EnvironmentalImpactCopyWith<$Res> {
  _$EnvironmentalImpactCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnvironmentalImpact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWasteRecycled = null,
    Object? co2Saved = null,
    Object? treesEquivalent = null,
    Object? carbonCreditScore = null,
  }) {
    return _then(_value.copyWith(
      totalWasteRecycled: null == totalWasteRecycled
          ? _value.totalWasteRecycled
          : totalWasteRecycled // ignore: cast_nullable_to_non_nullable
              as double,
      co2Saved: null == co2Saved
          ? _value.co2Saved
          : co2Saved // ignore: cast_nullable_to_non_nullable
              as double,
      treesEquivalent: null == treesEquivalent
          ? _value.treesEquivalent
          : treesEquivalent // ignore: cast_nullable_to_non_nullable
              as int,
      carbonCreditScore: null == carbonCreditScore
          ? _value.carbonCreditScore
          : carbonCreditScore // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EnvironmentalImpactImplCopyWith<$Res>
    implements $EnvironmentalImpactCopyWith<$Res> {
  factory _$$EnvironmentalImpactImplCopyWith(_$EnvironmentalImpactImpl value,
          $Res Function(_$EnvironmentalImpactImpl) then) =
      __$$EnvironmentalImpactImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double totalWasteRecycled,
      double co2Saved,
      int treesEquivalent,
      String carbonCreditScore});
}

/// @nodoc
class __$$EnvironmentalImpactImplCopyWithImpl<$Res>
    extends _$EnvironmentalImpactCopyWithImpl<$Res, _$EnvironmentalImpactImpl>
    implements _$$EnvironmentalImpactImplCopyWith<$Res> {
  __$$EnvironmentalImpactImplCopyWithImpl(_$EnvironmentalImpactImpl _value,
      $Res Function(_$EnvironmentalImpactImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnvironmentalImpact
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalWasteRecycled = null,
    Object? co2Saved = null,
    Object? treesEquivalent = null,
    Object? carbonCreditScore = null,
  }) {
    return _then(_$EnvironmentalImpactImpl(
      totalWasteRecycled: null == totalWasteRecycled
          ? _value.totalWasteRecycled
          : totalWasteRecycled // ignore: cast_nullable_to_non_nullable
              as double,
      co2Saved: null == co2Saved
          ? _value.co2Saved
          : co2Saved // ignore: cast_nullable_to_non_nullable
              as double,
      treesEquivalent: null == treesEquivalent
          ? _value.treesEquivalent
          : treesEquivalent // ignore: cast_nullable_to_non_nullable
              as int,
      carbonCreditScore: null == carbonCreditScore
          ? _value.carbonCreditScore
          : carbonCreditScore // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EnvironmentalImpactImpl implements _EnvironmentalImpact {
  const _$EnvironmentalImpactImpl(
      {required this.totalWasteRecycled,
      required this.co2Saved,
      required this.treesEquivalent,
      required this.carbonCreditScore});

  factory _$EnvironmentalImpactImpl.fromJson(Map<String, dynamic> json) =>
      _$$EnvironmentalImpactImplFromJson(json);

  @override
  final double totalWasteRecycled;
  @override
  final double co2Saved;
  @override
  final int treesEquivalent;
  @override
  final String carbonCreditScore;

  @override
  String toString() {
    return 'EnvironmentalImpact(totalWasteRecycled: $totalWasteRecycled, co2Saved: $co2Saved, treesEquivalent: $treesEquivalent, carbonCreditScore: $carbonCreditScore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EnvironmentalImpactImpl &&
            (identical(other.totalWasteRecycled, totalWasteRecycled) ||
                other.totalWasteRecycled == totalWasteRecycled) &&
            (identical(other.co2Saved, co2Saved) ||
                other.co2Saved == co2Saved) &&
            (identical(other.treesEquivalent, treesEquivalent) ||
                other.treesEquivalent == treesEquivalent) &&
            (identical(other.carbonCreditScore, carbonCreditScore) ||
                other.carbonCreditScore == carbonCreditScore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalWasteRecycled, co2Saved,
      treesEquivalent, carbonCreditScore);

  /// Create a copy of EnvironmentalImpact
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EnvironmentalImpactImplCopyWith<_$EnvironmentalImpactImpl> get copyWith =>
      __$$EnvironmentalImpactImplCopyWithImpl<_$EnvironmentalImpactImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EnvironmentalImpactImplToJson(
      this,
    );
  }
}

abstract class _EnvironmentalImpact implements EnvironmentalImpact {
  const factory _EnvironmentalImpact(
      {required final double totalWasteRecycled,
      required final double co2Saved,
      required final int treesEquivalent,
      required final String carbonCreditScore}) = _$EnvironmentalImpactImpl;

  factory _EnvironmentalImpact.fromJson(Map<String, dynamic> json) =
      _$EnvironmentalImpactImpl.fromJson;

  @override
  double get totalWasteRecycled;
  @override
  double get co2Saved;
  @override
  int get treesEquivalent;
  @override
  String get carbonCreditScore;

  /// Create a copy of EnvironmentalImpact
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EnvironmentalImpactImplCopyWith<_$EnvironmentalImpactImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
