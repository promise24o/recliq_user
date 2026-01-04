// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Notification _$NotificationFromJson(Map<String, dynamic> json) {
  return _Notification.fromJson(json);
}

/// @nodoc
mixin _$Notification {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  @JsonKey(name: 'createdAt')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'readAt')
  DateTime? get readAt => throw _privateConstructorUsedError;
  Map<String, dynamic>? get metadata => throw _privateConstructorUsedError;
  String? get priority => throw _privateConstructorUsedError;
  String? get actionUrl => throw _privateConstructorUsedError;
  String? get actionText => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationCopyWith<Notification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationCopyWith<$Res> {
  factory $NotificationCopyWith(
          Notification value, $Res Function(Notification) then) =
      _$NotificationCopyWithImpl<$Res, Notification>;
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String category,
      String type,
      bool isRead,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'readAt') DateTime? readAt,
      Map<String, dynamic>? metadata,
      String? priority,
      String? actionUrl,
      String? actionText,
      String? imageUrl});
}

/// @nodoc
class _$NotificationCopyWithImpl<$Res, $Val extends Notification>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? category = null,
    Object? type = null,
    Object? isRead = null,
    Object? createdAt = null,
    Object? readAt = freezed,
    Object? metadata = freezed,
    Object? priority = freezed,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationImplCopyWith<$Res>
    implements $NotificationCopyWith<$Res> {
  factory _$$NotificationImplCopyWith(
          _$NotificationImpl value, $Res Function(_$NotificationImpl) then) =
      __$$NotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String body,
      String category,
      String type,
      bool isRead,
      @JsonKey(name: 'createdAt') DateTime createdAt,
      @JsonKey(name: 'readAt') DateTime? readAt,
      Map<String, dynamic>? metadata,
      String? priority,
      String? actionUrl,
      String? actionText,
      String? imageUrl});
}

/// @nodoc
class __$$NotificationImplCopyWithImpl<$Res>
    extends _$NotificationCopyWithImpl<$Res, _$NotificationImpl>
    implements _$$NotificationImplCopyWith<$Res> {
  __$$NotificationImplCopyWithImpl(
      _$NotificationImpl _value, $Res Function(_$NotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? body = null,
    Object? category = null,
    Object? type = null,
    Object? isRead = null,
    Object? createdAt = null,
    Object? readAt = freezed,
    Object? metadata = freezed,
    Object? priority = freezed,
    Object? actionUrl = freezed,
    Object? actionText = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$NotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      readAt: freezed == readAt
          ? _value.readAt
          : readAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      metadata: freezed == metadata
          ? _value._metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      actionUrl: freezed == actionUrl
          ? _value.actionUrl
          : actionUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      actionText: freezed == actionText
          ? _value.actionText
          : actionText // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationImpl implements _Notification {
  const _$NotificationImpl(
      {required this.id,
      required this.title,
      required this.body,
      required this.category,
      required this.type,
      required this.isRead,
      @JsonKey(name: 'createdAt') required this.createdAt,
      @JsonKey(name: 'readAt') this.readAt,
      final Map<String, dynamic>? metadata,
      this.priority,
      this.actionUrl,
      this.actionText,
      this.imageUrl})
      : _metadata = metadata;

  factory _$NotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationImplFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String body;
  @override
  final String category;
  @override
  final String type;
  @override
  final bool isRead;
  @override
  @JsonKey(name: 'createdAt')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'readAt')
  final DateTime? readAt;
  final Map<String, dynamic>? _metadata;
  @override
  Map<String, dynamic>? get metadata {
    final value = _metadata;
    if (value == null) return null;
    if (_metadata is EqualUnmodifiableMapView) return _metadata;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final String? priority;
  @override
  final String? actionUrl;
  @override
  final String? actionText;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'Notification(id: $id, title: $title, body: $body, category: $category, type: $type, isRead: $isRead, createdAt: $createdAt, readAt: $readAt, metadata: $metadata, priority: $priority, actionUrl: $actionUrl, actionText: $actionText, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.readAt, readAt) || other.readAt == readAt) &&
            const DeepCollectionEquality().equals(other._metadata, _metadata) &&
            (identical(other.priority, priority) ||
                other.priority == priority) &&
            (identical(other.actionUrl, actionUrl) ||
                other.actionUrl == actionUrl) &&
            (identical(other.actionText, actionText) ||
                other.actionText == actionText) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      body,
      category,
      type,
      isRead,
      createdAt,
      readAt,
      const DeepCollectionEquality().hash(_metadata),
      priority,
      actionUrl,
      actionText,
      imageUrl);

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      __$$NotificationImplCopyWithImpl<_$NotificationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationImplToJson(
      this,
    );
  }
}

abstract class _Notification implements Notification {
  const factory _Notification(
      {required final String id,
      required final String title,
      required final String body,
      required final String category,
      required final String type,
      required final bool isRead,
      @JsonKey(name: 'createdAt') required final DateTime createdAt,
      @JsonKey(name: 'readAt') final DateTime? readAt,
      final Map<String, dynamic>? metadata,
      final String? priority,
      final String? actionUrl,
      final String? actionText,
      final String? imageUrl}) = _$NotificationImpl;

  factory _Notification.fromJson(Map<String, dynamic> json) =
      _$NotificationImpl.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get body;
  @override
  String get category;
  @override
  String get type;
  @override
  bool get isRead;
  @override
  @JsonKey(name: 'createdAt')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'readAt')
  DateTime? get readAt;
  @override
  Map<String, dynamic>? get metadata;
  @override
  String? get priority;
  @override
  String? get actionUrl;
  @override
  String? get actionText;
  @override
  String? get imageUrl;

  /// Create a copy of Notification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationImplCopyWith<_$NotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NotificationListResponse _$NotificationListResponseFromJson(
    Map<String, dynamic> json) {
  return _NotificationListResponse.fromJson(json);
}

/// @nodoc
mixin _$NotificationListResponse {
  List<Notification> get notifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'unreadCount')
  int get unreadCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'hasMore')
  bool get hasMore => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this NotificationListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationListResponseCopyWith<NotificationListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationListResponseCopyWith<$Res> {
  factory $NotificationListResponseCopyWith(NotificationListResponse value,
          $Res Function(NotificationListResponse) then) =
      _$NotificationListResponseCopyWithImpl<$Res, NotificationListResponse>;
  @useResult
  $Res call(
      {List<Notification> notifications,
      @JsonKey(name: 'unreadCount') int unreadCount,
      @JsonKey(name: 'hasMore') bool hasMore,
      int total});
}

/// @nodoc
class _$NotificationListResponseCopyWithImpl<$Res,
        $Val extends NotificationListResponse>
    implements $NotificationListResponseCopyWith<$Res> {
  _$NotificationListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? hasMore = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationListResponseImplCopyWith<$Res>
    implements $NotificationListResponseCopyWith<$Res> {
  factory _$$NotificationListResponseImplCopyWith(
          _$NotificationListResponseImpl value,
          $Res Function(_$NotificationListResponseImpl) then) =
      __$$NotificationListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Notification> notifications,
      @JsonKey(name: 'unreadCount') int unreadCount,
      @JsonKey(name: 'hasMore') bool hasMore,
      int total});
}

/// @nodoc
class __$$NotificationListResponseImplCopyWithImpl<$Res>
    extends _$NotificationListResponseCopyWithImpl<$Res,
        _$NotificationListResponseImpl>
    implements _$$NotificationListResponseImplCopyWith<$Res> {
  __$$NotificationListResponseImplCopyWithImpl(
      _$NotificationListResponseImpl _value,
      $Res Function(_$NotificationListResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? notifications = null,
    Object? unreadCount = null,
    Object? hasMore = null,
    Object? total = null,
  }) {
    return _then(_$NotificationListResponseImpl(
      notifications: null == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<Notification>,
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
      hasMore: null == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationListResponseImpl implements _NotificationListResponse {
  const _$NotificationListResponseImpl(
      {required final List<Notification> notifications,
      @JsonKey(name: 'unreadCount') required this.unreadCount,
      @JsonKey(name: 'hasMore') required this.hasMore,
      required this.total})
      : _notifications = notifications;

  factory _$NotificationListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationListResponseImplFromJson(json);

  final List<Notification> _notifications;
  @override
  List<Notification> get notifications {
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_notifications);
  }

  @override
  @JsonKey(name: 'unreadCount')
  final int unreadCount;
  @override
  @JsonKey(name: 'hasMore')
  final bool hasMore;
  @override
  final int total;

  @override
  String toString() {
    return 'NotificationListResponse(notifications: $notifications, unreadCount: $unreadCount, hasMore: $hasMore, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationListResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_notifications),
      unreadCount,
      hasMore,
      total);

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
      get copyWith => __$$NotificationListResponseImplCopyWithImpl<
          _$NotificationListResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationListResponseImplToJson(
      this,
    );
  }
}

abstract class _NotificationListResponse implements NotificationListResponse {
  const factory _NotificationListResponse(
      {required final List<Notification> notifications,
      @JsonKey(name: 'unreadCount') required final int unreadCount,
      @JsonKey(name: 'hasMore') required final bool hasMore,
      required final int total}) = _$NotificationListResponseImpl;

  factory _NotificationListResponse.fromJson(Map<String, dynamic> json) =
      _$NotificationListResponseImpl.fromJson;

  @override
  List<Notification> get notifications;
  @override
  @JsonKey(name: 'unreadCount')
  int get unreadCount;
  @override
  @JsonKey(name: 'hasMore')
  bool get hasMore;
  @override
  int get total;

  /// Create a copy of NotificationListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationListResponseImplCopyWith<_$NotificationListResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UnreadCountResponse _$UnreadCountResponseFromJson(Map<String, dynamic> json) {
  return _UnreadCountResponse.fromJson(json);
}

/// @nodoc
mixin _$UnreadCountResponse {
  @JsonKey(name: 'unreadCount')
  int get unreadCount => throw _privateConstructorUsedError;

  /// Serializes this UnreadCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnreadCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnreadCountResponseCopyWith<UnreadCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnreadCountResponseCopyWith<$Res> {
  factory $UnreadCountResponseCopyWith(
          UnreadCountResponse value, $Res Function(UnreadCountResponse) then) =
      _$UnreadCountResponseCopyWithImpl<$Res, UnreadCountResponse>;
  @useResult
  $Res call({@JsonKey(name: 'unreadCount') int unreadCount});
}

/// @nodoc
class _$UnreadCountResponseCopyWithImpl<$Res, $Val extends UnreadCountResponse>
    implements $UnreadCountResponseCopyWith<$Res> {
  _$UnreadCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnreadCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_value.copyWith(
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UnreadCountResponseImplCopyWith<$Res>
    implements $UnreadCountResponseCopyWith<$Res> {
  factory _$$UnreadCountResponseImplCopyWith(_$UnreadCountResponseImpl value,
          $Res Function(_$UnreadCountResponseImpl) then) =
      __$$UnreadCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'unreadCount') int unreadCount});
}

/// @nodoc
class __$$UnreadCountResponseImplCopyWithImpl<$Res>
    extends _$UnreadCountResponseCopyWithImpl<$Res, _$UnreadCountResponseImpl>
    implements _$$UnreadCountResponseImplCopyWith<$Res> {
  __$$UnreadCountResponseImplCopyWithImpl(_$UnreadCountResponseImpl _value,
      $Res Function(_$UnreadCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnreadCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unreadCount = null,
  }) {
    return _then(_$UnreadCountResponseImpl(
      unreadCount: null == unreadCount
          ? _value.unreadCount
          : unreadCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnreadCountResponseImpl implements _UnreadCountResponse {
  const _$UnreadCountResponseImpl(
      {@JsonKey(name: 'unreadCount') required this.unreadCount});

  factory _$UnreadCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnreadCountResponseImplFromJson(json);

  @override
  @JsonKey(name: 'unreadCount')
  final int unreadCount;

  @override
  String toString() {
    return 'UnreadCountResponse(unreadCount: $unreadCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnreadCountResponseImpl &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, unreadCount);

  /// Create a copy of UnreadCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnreadCountResponseImplCopyWith<_$UnreadCountResponseImpl> get copyWith =>
      __$$UnreadCountResponseImplCopyWithImpl<_$UnreadCountResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnreadCountResponseImplToJson(
      this,
    );
  }
}

abstract class _UnreadCountResponse implements UnreadCountResponse {
  const factory _UnreadCountResponse(
          {@JsonKey(name: 'unreadCount') required final int unreadCount}) =
      _$UnreadCountResponseImpl;

  factory _UnreadCountResponse.fromJson(Map<String, dynamic> json) =
      _$UnreadCountResponseImpl.fromJson;

  @override
  @JsonKey(name: 'unreadCount')
  int get unreadCount;

  /// Create a copy of UnreadCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnreadCountResponseImplCopyWith<_$UnreadCountResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
