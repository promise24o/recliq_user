import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/kyc_status.dart';
import '../entities/bank_info.dart';
import '../entities/bvn_verification.dart';
import '../entities/kyc_initialization.dart';

abstract class KycRepository {
  Future<Either<Failure, KycInitializationResponse>> initializeKyc({
    required String userId,
    required String userType,
  });
  Future<Either<Failure, KycStatus>> getKycStatus(String userId);
  Future<Either<Failure, List<BankInfo>>> getBanks();
  Future<Either<Failure, AccountResolution>> resolveAccount({
    required String accountNumber,
    required String bankCode,
  });
  Future<Either<Failure, BvnVerificationResponse>> verifyBvn({
    required String userId,
    required String bvn,
    required String accountNumber,
    required String bankCode,
    required String userName,
  });
  Future<Either<Failure, void>> submitBusinessDetails(Map<String, dynamic> businessDetails);
  Future<Either<Failure, Map<String, dynamic>>> uploadDocument({
    required String userId,
    required String documentType,
    required File document,
  });
}
