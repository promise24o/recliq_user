import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reward_activity.freezed.dart';
part 'reward_activity.g.dart';

class ActivityTypeConverter implements JsonConverter<ActivityType, String> {
  const ActivityTypeConverter();

  @override
  ActivityType fromJson(String json) => ActivityType.fromString(json);

  @override
  String toJson(ActivityType type) => type.toString().split('.').last;
}

@freezed
class RewardActivity with _$RewardActivity {
  const factory RewardActivity({
    required String id,
    required int points,
    required String description,
    required DateTime date,
    @ActivityTypeConverter() required ActivityType type,
  }) = _RewardActivity;

  factory RewardActivity.fromJson(Map<String, dynamic> json) => RewardActivity(
        id: json['id'] as String,
        points: json['points'] as int,
        description: json['description'] as String,
        date: DateTime.parse(json['date'] as String),
        type: const ActivityTypeConverter().fromJson(json['type'] as String),
      );
}

@freezed
class ActivityType with _$ActivityType {
  const factory ActivityType.recyle() = _Recyle;
  const factory ActivityType.streak() = _Streak;
  const factory ActivityType.badge() = _Badge;
  const factory ActivityType.challenge() = _Challenge;
  const factory ActivityType.referral() = _Referral;

  static ActivityType fromString(String type) {
    switch (type.toUpperCase()) {
      case 'RECYCLE':
        return const ActivityType.recyle();
      case 'STREAK':
        return const ActivityType.streak();
      case 'BADGE':
        return const ActivityType.badge();
      case 'CHALLENGE':
        return const ActivityType.challenge();
      case 'REFERRAL':
        return const ActivityType.referral();
      default:
        throw ArgumentError('Unknown activity type: $type');
    }
  }
}
