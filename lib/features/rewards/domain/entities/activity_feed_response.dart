import 'package:freezed_annotation/freezed_annotation.dart';
import 'reward_activity.dart';

part 'activity_feed_response.freezed.dart';
part 'activity_feed_response.g.dart';

@freezed
class ActivityFeedResponse with _$ActivityFeedResponse {
  const factory ActivityFeedResponse({
    required List<RewardActivity> activity,
    required bool hasMore,
  }) = _ActivityFeedResponse;

  factory ActivityFeedResponse.fromJson(Map<String, dynamic> json) =>
      _$ActivityFeedResponseFromJson(json);
}
