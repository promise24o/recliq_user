import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> sendOtp(String phoneNumber);
  Future<Either<Failure, User>> verifyOtp(String phoneNumber, String otp);
  Future<Either<Failure, String>> register(String name, String email,
      {String? password});
  Future<Either<Failure, User>> verifyOtpEmail(String email, String otp);
  Future<Either<Failure, User>> signup({
    required String phoneNumber,
    String? email,
    String? name,
    String? password,
  });
  Future<Either<Failure, String>> resendOtp(String identifier);
  Future<Either<Failure, User>> login(String identifier, {String? password});
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, User>> getCurrentUserFromToken();
  Future<Either<Failure, void>> forgotPassword(String email);
  Future<Either<Failure, User>> resetPassword(
      String email, String otp, String newPassword);
}
