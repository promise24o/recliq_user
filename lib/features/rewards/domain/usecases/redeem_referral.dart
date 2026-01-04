import 'package:dartz/dartz.dart';
import '../entities/redeem_referral_response.dart';
import '../repositories/rewards_repository.dart';

class RedeemReferral {
  final RewardsRepository _repository;

  RedeemReferral(this._repository);

  Future<Either<String, RedeemReferralResponse>> call(
      List<String>? referralIds) async {
    return await _repository.redeemReferral(referralIds);
  }
}
