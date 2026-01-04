import 'package:dartz/dartz.dart';
import '../../../auth/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> getCurrentUser();
  Future<Either<Failure, User>> updateProfile({
    required String name,
    String? profilePhoto,
    String? phone,
    required bool priceUpdates,
    required bool loginEmails,
  });
  Future<Either<Failure, String>> uploadProfilePhoto(String imagePath);
  Future<Either<Failure, void>> toggleBiometric(bool enabled);
  Future<Either<Failure, void>> setupPin(String pin);
  Future<Either<Failure, void>> updatePin(String oldPin, String newPin);
  Future<Either<Failure, void>> forgotPin(
      String email, String otp, String newPin);
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, String>> refreshToken(String refreshToken);
  Future<Either<Failure, void>> sendOtpToEmail(String email);
}
