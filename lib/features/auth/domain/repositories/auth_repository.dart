import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  Future<Either<Failure, User>> verifyOtp(String phoneNumber, String otp);
  Future<Either<Failure, User>> signup({
    required String phoneNumber,
    String? email,
    String? name,
  });
  Future<Either<Failure, User>> login(String phoneNumber);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCurrentUser();
}
