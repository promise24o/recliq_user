import 'package:dartz/dartz.dart';
import '../entities/referral_response.dart';
import '../repositories/rewards_repository.dart';

class GetReferral {
  final RewardsRepository _repository;

  GetReferral(this._repository);

  Future<Either<String, ReferralResponse>> call() async {
    return await _repository.getReferral();
  }
}
