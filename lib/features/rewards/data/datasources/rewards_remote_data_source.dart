import 'package:dio/dio.dart';
import '../../domain/entities/reward_points.dart';
import '../../domain/entities/recycling_streak.dart';
import '../../domain/entities/reward_benefit.dart';
import '../../domain/entities/referral_reward.dart';
import '../../domain/entities/reward_activity.dart';
import '../../domain/entities/rewards_overview.dart';
import '../../domain/entities/activity_feed_response.dart';
import '../../domain/entities/streak_response.dart';
import '../../domain/entities/badges_response.dart';
import '../../domain/entities/environmental_impact_response.dart';
import '../../domain/entities/challenges_response.dart';
import '../../domain/entities/referral_response.dart';
import '../../domain/entities/redeem_referral_response.dart';

abstract class RewardsRemoteDataSource {
  Future<RewardsOverview> getRewardsOverview();
  Future<ActivityFeedResponse> getActivityFeed({
    int limit = 20,
    int offset = 0,
  });
  Future<StreakResponse> getStreak();
  Future<BadgesResponse> getBadges();
  Future<EnvironmentalImpactResponse> getEnvironmentalImpact();
  Future<ChallengesResponse> getChallenges();
  Future<ReferralResponse> getReferral();
  Future<RewardPoints> getRewardPoints();
  Future<RecyclingStreak> getRecyclingStreak();
  Future<ReferralReward> getReferralReward();
  Future<List<RewardActivity>> getRewardActivity();
  Future<List<RewardBenefit>> getRewardBenefits();
  Future<void> updateChallengeProgress(String challengeId, int progress);
  Future<void> redeemBenefit(String benefitId);
  Future<String> generateReferralCode();
  Future<RedeemReferralResponse> redeemReferral(List<String>? referralIds);
}

class RewardsRemoteDataSourceImpl implements RewardsRemoteDataSource {
  final Dio _dio;

  RewardsRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  bool _isSuccessStatusCode(int? statusCode) {
    return statusCode != null && statusCode >= 200 && statusCode < 300;
  }

  @override
  Future<RewardsOverview> getRewardsOverview() async {
    try {
      final response = await _dio.get('/rewards/overview');

      if (_isSuccessStatusCode(response.statusCode)) {
        return RewardsOverview.fromJson(response.data);
      } else {
        throw Exception('Failed to load rewards overview');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load rewards overview: $e');
    }
  }

  @override
  Future<ActivityFeedResponse> getActivityFeed({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await _dio.get(
        '/rewards/activity',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        return ActivityFeedResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load activity feed');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 400) {
        throw Exception('Invalid pagination parameters');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load activity feed: $e');
    }
  }

  @override
  Future<StreakResponse> getStreak() async {
    try {
      final response = await _dio.get('/rewards/streak');

      if (_isSuccessStatusCode(response.statusCode)) {
        return StreakResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load streak information');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load streak information: $e');
    }
  }

  @override
  Future<BadgesResponse> getBadges() async {
    try {
      final response = await _dio.get('/rewards/badges');

      if (_isSuccessStatusCode(response.statusCode)) {
        return BadgesResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load badges');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load badges: $e');
    }
  }

  @override
  Future<EnvironmentalImpactResponse> getEnvironmentalImpact() async {
    try {
      final response = await _dio.get('/rewards/impact');

      if (_isSuccessStatusCode(response.statusCode)) {
        return EnvironmentalImpactResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load environmental impact');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load environmental impact: $e');
    }
  }

  @override
  Future<ChallengesResponse> getChallenges() async {
    try {
      final response = await _dio.get('/rewards/challenges');

      if (_isSuccessStatusCode(response.statusCode)) {
        return ChallengesResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load challenges');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load challenges: $e');
    }
  }

  @override
  Future<ReferralResponse> getReferral() async {
    try {
      final response = await _dio.get('/rewards/referrals');

      if (_isSuccessStatusCode(response.statusCode)) {
        return ReferralResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load referral information');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load referral information: $e');
    }
  }

  @override
  Future<RewardPoints> getRewardPoints() async {
    try {
      final response = await _dio.get('/rewards/points');

      if (_isSuccessStatusCode(response.statusCode)) {
        return RewardPoints.fromJson(response.data);
      } else {
        throw Exception('Failed to load reward points');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load reward points: $e');
    }
  }

  @override
  Future<RecyclingStreak> getRecyclingStreak() async {
    try {
      final response = await _dio.get('/rewards/streak');

      if (_isSuccessStatusCode(response.statusCode)) {
        return RecyclingStreak.fromJson(response.data);
      } else {
        throw Exception('Failed to load recycling streak');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load recycling streak: $e');
    }
  }

  @override
  Future<ReferralReward> getReferralReward() async {
    try {
      final response = await _dio.get('/rewards/referral-reward');

      if (_isSuccessStatusCode(response.statusCode)) {
        return ReferralReward.fromJson(response.data);
      } else {
        throw Exception('Failed to load referral reward');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load referral reward: $e');
    }
  }

  @override
  Future<List<RewardActivity>> getRewardActivity() async {
    try {
      final response = await _dio.get('/rewards/activity');

      if (_isSuccessStatusCode(response.statusCode)) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => RewardActivity.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reward activity');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load reward activity: $e');
    }
  }

  @override
  Future<List<RewardBenefit>> getRewardBenefits() async {
    try {
      final response = await _dio.get('/rewards/benefits');

      if (_isSuccessStatusCode(response.statusCode)) {
        final List<dynamic> jsonData = response.data;
        return jsonData.map((json) => RewardBenefit.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load reward benefits');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to load reward benefits: $e');
    }
  }

  @override
  Future<String> generateReferralCode() async {
    try {
      final response = await _dio.post('/rewards/generate-referral');

      if (_isSuccessStatusCode(response.statusCode)) {
        return response.data['referralCode'] ?? '';
      } else {
        throw Exception('Failed to generate referral code');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to generate referral code: $e');
    }
  }

  @override
  Future<RedeemReferralResponse> redeemReferral(
      List<String>? referralIds) async {
    try {
      final Map<String, dynamic> data = {};
      if (referralIds != null && referralIds.isNotEmpty) {
        data['referralIds'] = referralIds;
      }

      final response = await _dio.post(
        '/rewards/referrals/redeem',
        data: data.isEmpty ? null : data,
      );

      if (_isSuccessStatusCode(response.statusCode)) {
        return RedeemReferralResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to redeem referrals');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to redeem referrals: $e');
    }
  }

  @override
  Future<void> updateChallengeProgress(String challengeId, int progress) async {
    try {
      final response = await _dio.post(
        '/rewards/challenges/$challengeId/progress',
        data: {'progress': progress},
      );

      if (!_isSuccessStatusCode(response.statusCode)) {
        throw Exception('Failed to update challenge progress');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to update challenge progress: $e');
    }
  }

  @override
  Future<void> redeemBenefit(String benefitId) async {
    try {
      final response = await _dio.post('/rewards/benefits/$benefitId/redeem');

      if (!_isSuccessStatusCode(response.statusCode)) {
        throw Exception('Failed to redeem benefit');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Network timeout');
      } else if (e.response?.statusCode == 401) {
        throw Exception('Unauthorized - Please login again');
      } else if (e.response?.statusCode == 500) {
        throw Exception('Internal server error');
      } else {
        throw Exception('Network error: ${e.message}');
      }
    } catch (e) {
      throw Exception('Failed to redeem benefit: $e');
    }
  }
}
