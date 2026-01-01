import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  User? _currentUser;

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock success response
      return const Right('OTP sent successfully');
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOtp(
    String phoneNumber,
    String otp,
  ) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Validate OTP (mock validation)
      if (otp.length != 6) {
        return Left(InvalidInputFailure('Invalid OTP format'));
      }

      // Mock success response
      final user = User(
        id: 'mock_user_id',
        phoneNumber: phoneNumber,
        isVerified: true,
      );
      _currentUser = user;
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signup({
    required String phoneNumber,
    String? email,
    String? name,
  }) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock success response
      final user = User(
        id: 'mock_user_id',
        phoneNumber: phoneNumber,
        email: email,
        name: name,
      );
      _currentUser = user;
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login(String phoneNumber) async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Mock success response
      final user = User(id: 'mock_user_id', phoneNumber: phoneNumber);
      _currentUser = user;
      return Right(user);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 1));

      // Clear current user
      _currentUser = null;
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      if (_currentUser == null) {
        return Left(UnauthorizedFailure());
      }
      return Right(_currentUser!);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
