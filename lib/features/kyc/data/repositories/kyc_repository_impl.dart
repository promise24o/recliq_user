import 'dart:io';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/kyc_status.dart';
import '../../domain/entities/bank_info.dart';
import '../../domain/entities/bvn_verification.dart';
import '../../domain/entities/kyc_initialization.dart';
import '../../domain/repositories/kyc_repository.dart';
import '../datasources/kyc_remote_datasource.dart';

class KycRepositoryImpl implements KycRepository {
  final KycRemoteDataSource remoteDataSource;

  KycRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, KycInitializationResponse>> initializeKyc({
    required String userId,
    required String userType,
  }) async {
    try {
      final result = await remoteDataSource.initializeKyc(
        userId: userId,
        userType: userType,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, KycStatus>> getKycStatus(String userId) async {
    try {
      final result = await remoteDataSource.getKycStatus(userId);
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BankInfo>>> getBanks() async {
    try {
      final result = await remoteDataSource.getBanks();
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AccountResolution>> resolveAccount({
    required String accountNumber,
    required String bankCode,
  }) async {
    try {
      final result = await remoteDataSource.resolveAccount(
        accountNumber: accountNumber,
        bankCode: bankCode,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BvnVerificationResponse>> verifyBvn({
    required String userId,
    required String bvn,
    required String accountNumber,
    required String bankCode,
    required String userName,
  }) async {
    try {
      final result = await remoteDataSource.verifyBvn(
        userId: userId,
        bvn: bvn,
        accountNumber: accountNumber,
        bankCode: bankCode,
        userName: userName,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> submitBusinessDetails(Map<String, dynamic> businessDetails) async {
    try {
      await remoteDataSource.submitBusinessDetails(businessDetails);
      return Right(null);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> uploadDocument({
    required String userId,
    required String documentType,
    required File document,
  }) async {
    try {
      final result = await remoteDataSource.uploadDocument(
        userId: userId,
        documentType: documentType,
        document: document,
      );
      return Right(result);
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }
}
