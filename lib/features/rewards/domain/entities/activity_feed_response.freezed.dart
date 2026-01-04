// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activity_feed_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActivityFeedResponse _$ActivityFeedResponseFromJson(Map<String, dynamic> json) {
  return _ActivityFeedResponse.fromJson(json);
}

/// @nodoc
mixin _$ActivityFeedResponse {
  List<RewardActivity> get activity => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this ActivityFeedResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActivityFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActivityFeedResponseCopyWith<ActivityFeedResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityFeedResponseCopyWith<$Res> {
  factory $ActivityFeedResponseCopyWith(ActivityFeedResponse value,
          $Res Function(ActivityFeedResponse) then) =
      _$ActivityFeedResponseCopyWithImpl<$Res, ActivityFeedResponse>;
  @useResult
  $Res call({List<RewardActivity> activity, bool hasMore});
}

/// @nodoc
class _$ActivityFeedResponseCopyWithImpl<$Res,
        $Val extends ActivityFeedResponse>
    implements $ActivityFeedResponseCopyWith<$Res> {
  _$ActivityFeedResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActivityFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? hasMore = null,
  }) {
    return _then(_value.copyWith(
      activity: null == activity
          ? _value.activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<RewardActivity>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActivityFeedResponseImplCopyWith<$Res>
    implements $ActivityFeedResponseCopyWith<$Res> {
  factory _$$ActivityFeedResponseImplCopyWith(_$ActivityFeedResponseImpl value,
          $Res Function(_$ActivityFeedResponseImpl) then) =
      __$$ActivityFeedResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<RewardActivity> activity, bool hasMore});
}

/// @nodoc
class __$$ActivityFeedResponseImplCopyWithImpl<$Res>
    extends _$ActivityFeedResponseCopyWithImpl<$Res, _$ActivityFeedResponseImpl>
    implements _$$ActivityFeedResponseImplCopyWith<$Res> {
  __$$ActivityFeedResponseImplCopyWithImpl(_$ActivityFeedResponseImpl _value,
      $Res Function(_$ActivityFeedResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActivityFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activity = null,
    Object? hasMore = null,
  }) {
    return _then(_$ActivityFeedResponseImpl(
      activity: null == activity
          ? _value._activity
          : activity // ignore: cast_nullable_to_non_nullable
              as List<RewardActivity>,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActivityFeedResponseImpl implements _ActivityFeedResponse {
  const _$ActivityFeedResponseImpl(
      {required final List<RewardActivity> activity, required this.hasMore})
      : _activity = activity;

  factory _$ActivityFeedResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActivityFeedResponseImplFromJson(json);

  final List<RewardActivity> _activity;
  @override
  List<RewardActivity> get activity {
    if (_activity is EqualUnmodifiableListView) return _activity;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activity);
  }

  @override
  final bool hasMore;

  @override
  String toString() {
    return 'ActivityFeedResponse(activity: $activity, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivityFeedResponseImpl &&
            const DeepCollectionEquality().equals(other._activity, _activity) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_activity), hasMore);

  /// Create a copy of ActivityFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivityFeedResponseImplCopyWith<_$ActivityFeedResponseImpl>
      get copyWith =>
          __$$ActivityFeedResponseImplCopyWithImpl<_$ActivityFeedResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActivityFeedResponseImplToJson(
      this,
    );
  }
}

abstract class _ActivityFeedResponse implements ActivityFeedResponse {
  const factory _ActivityFeedResponse(
      {required final List<RewardActivity> activity,
      required final bool hasMore}) = _$ActivityFeedResponseImpl;

  factory _ActivityFeedResponse.fromJson(Map<String, dynamic> json) =
      _$ActivityFeedResponseImpl.fromJson;

  @override
  List<RewardActivity> get activity;
  @override
  bool get hasMore;

  /// Create a copy of ActivityFeedResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivityFeedResponseImplCopyWith<_$ActivityFeedResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
