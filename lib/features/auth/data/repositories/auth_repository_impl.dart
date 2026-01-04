import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  AuthRepositoryImpl(@Named('secure_storage') this._secureStorage, this._dio);

  User? _currentUser;

  bool _isSuccess(Response response) =>
      response.statusCode != null &&
      response.statusCode! >= 200 &&
      response.statusCode! < 300;

  Failure _mapDioError(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data['message'] is String) {
      return ServerFailure(data['message']);
    }
    if (data is String && data.isNotEmpty) {
      return ServerFailure(data);
    }
    return ServerFailure(
      'Request failed${e.response?.statusCode != null ? ' (${e.response!.statusCode})' : ''}',
    );
  }

  @override
  Future<Either<Failure, String>> sendOtp(String phoneNumber) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
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
      await Future.delayed(const Duration(seconds: 1));

      if (otp.length != 6) {
        return Left(InvalidInputFailure('Invalid OTP format'));
      }

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
  Future<Either<Failure, String>> register(
    String name,
    String email, {
    String? password,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/register',
        data: {
          'name': name,
          'identifier': email,
          if (password != null) 'password': password,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        return Right(response.data['message'] as String);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOtpEmail(
    String email,
    String otp,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/verify-otp',
        data: {
          'identifier': email,
          'otp': otp,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        final data = response.data;
        final user = User(
          id: data['user']['id'],
          name: data['user']['name'],
          email: data['user']['email'],
          role: data['user']['role'],
          phoneNumber: data['user']['phoneNumber'],
          isVerified: data['user']['isVerified'] ?? true,
          walletBalance: (data['user']['walletBalance'] ?? 0).toDouble(),
          profilePhoto: data['user']['profilePhoto'],
        );

        _currentUser = user;

        // Store tokens in secure storage
        await _secureStorage.write(
            key: 'access_token', value: data['accessToken']);
        await _secureStorage.write(
            key: 'refresh_token', value: data['refreshToken']);

        // Store complete user object in secure storage
        await _secureStorage.write(
            key: 'user_data', value: user.toJson().toString());

        return Right(user);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signup({
    required String phoneNumber,
    String? email,
    String? name,
    String? password,
  }) async {
    try {
      final response = await _dio.post('/auth/register', data: {
        'name': name,
        'identifier': email,
        if (password != null) 'password': password,
        'role': 'USER',
      });

      if (_isSuccess(response)) {
        final user = User(
          id: 'temp_id',
          email: email,
          name: name,
          phoneNumber: phoneNumber,
        );
        _currentUser = user;
        return Right(user);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp(String identifier) async {
    try {
      final response = await _dio.post(
        '/auth/resend-otp',
        data: {
          'identifier': identifier,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        return Right(response.data['message'] as String);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> login(String identifier,
      {String? password}) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'identifier': identifier,
          if (password != null) 'password': password,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        // For login, we just need to return success to proceed to OTP
        // The actual user data will be set after OTP verification
        final user = User(
          id: 'temp_id',
          email: identifier.contains('@') ? identifier : null,
          phoneNumber: identifier.contains('@') ? null : identifier,
        );
        _currentUser = user;
        return Right(user);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      _currentUser = null;
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUserFromToken() async {
    try {
      final response = await _dio.get(
        '/auth/me',
        options: Options(extra: {'requiresAuth': true}),
      );

      if (_isSuccess(response)) {
        final user = User.fromJson(response.data);
        _currentUser = user;

        // Update stored user data
        await _secureStorage.write(
            key: 'user_data', value: user.toJson().toString());

        return Right(user);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      // First check if we have a user in memory
      if (_currentUser != null) {
        return Right(_currentUser!);
      }

      // Check if we have an access token
      final accessToken = await _secureStorage.read(key: 'access_token');

      if (accessToken != null) {
        // Token exists, call /auth/me to get current user data
        return await getCurrentUserFromToken();
      }

      // No token found, user is not authenticated
      return Left(UnauthorizedFailure());
    } catch (e) {
      return Left(UnauthorizedFailure());
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      final response = await _dio.post(
        '/auth/forgot-password',
        data: {
          'email': email,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        return const Right(null);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> resetPassword(
      String email, String otp, String newPassword) async {
    try {
      final response = await _dio.post(
        '/auth/reset-password',
        data: {
          'email': email,
          'otp': otp,
          'newPassword': newPassword,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        final data = response.data;
        final user = User.fromJson(data['user']);

        // Store tokens and user data
        await _secureStorage.write(
            key: 'access_token', value: data['accessToken']);
        await _secureStorage.write(
            key: 'refresh_token', value: data['refreshToken']);
        await _secureStorage.write(
            key: 'user_data', value: user.toJson().toString());

        _currentUser = user;
        return Right(user);
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
