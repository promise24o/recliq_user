import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';

@injectable
class ProfileRepositoryImpl implements ProfileRepository {
  final Dio _dio;
  final FlutterSecureStorage _secureStorage;

  ProfileRepositoryImpl(
    @Named('secure_storage') this._secureStorage,
    this._dio,
  );

  @override
  Future<Either<Failure, User>> getCurrentUser() async {
    try {
      final response = await _dio.get(
        '/auth/me',
        options: Options(extra: {'requiresAuth': true}),
      );

      if (_isSuccess(response)) {
        final user = User.fromJson(response.data);
        return Right(user);
      }

      // For non-successful responses, throw DioException to go through proper error mapping
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> updateProfile({
    required String name,
    String? profilePhoto,
    String? phone,
    required bool priceUpdates,
    required bool loginEmails,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/update-profile',
        data: {
          'name': name,
          if (profilePhoto != null) 'profilePhoto': profilePhoto,
          if (phone != null) 'phone': phone,
          'priceUpdates': priceUpdates,
          'loginEmails': loginEmails,
        },
        options: Options(extra: {'requiresAuth': true}),
      );

      if (_isSuccess(response)) {
        final userResponse = await getCurrentUser();
        return userResponse;
      }

      // For non-successful responses, create a DioException to go through proper error mapping
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> uploadProfilePhoto(String imagePath) async {
    try {
      final formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(imagePath),
      });

      final response = await _dio.post(
        '/auth/upload-photo',
        data: formData,
        options: Options(extra: {'requiresAuth': true}),
      );

      if (_isSuccess(response)) {
        // After successful upload, we need to get the updated user data
        // to retrieve the new profile photo URL
        final userResponse = await _dio.get(
          '/auth/me',
          options: Options(extra: {'requiresAuth': true}),
        );

        if (_isSuccess(userResponse)) {
          final photoUrl = userResponse.data['profilePhoto'] as String?;
          if (photoUrl != null) {
            return Right(photoUrl);
          }
        }

        // If we can't get the photo URL, return an error
        return Left(ServerFailure('Failed to retrieve uploaded photo URL'));
      }

      return Left(ServerFailure(response.data['message']));
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> toggleBiometric(bool enabled) async {
    try {
      final response = await _dio.post(
        '/auth/biometric',
        data: {
          'enabled': enabled,
        },
        options: Options(extra: {'requiresAuth': true}),
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
  Future<Either<Failure, void>> setupPin(String pin) async {
    try {
      final response = await _dio.post(
        '/auth/setup-pin',
        data: {
          'pin': pin,
        },
        options: Options(extra: {'requiresAuth': true}),
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
  Future<Either<Failure, void>> updatePin(String oldPin, String newPin) async {
    try {
      final response = await _dio.post(
        '/auth/update-pin',
        data: {
          'oldPin': oldPin,
          'newPin': newPin,
        },
        options: Options(extra: {'requiresAuth': true}),
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
  Future<Either<Failure, void>> forgotPin(
    String email,
    String otp,
    String newPin,
  ) async {
    try {
      final response = await _dio.post(
        '/auth/forgot-pin',
        data: {
          'email': email,
          'otp': otp,
          'newPin': newPin,
        },
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
  Future<Either<Failure, void>> logout() async {
    try {
      final response = await _dio.post(
        '/auth/logout',
        options: Options(extra: {'requiresAuth': true}),
      );

      if (_isSuccess(response)) {
        // Clear stored tokens
        await _secureStorage.delete(key: 'access_token');
        await _secureStorage.delete(key: 'refresh_token');
        await _secureStorage.delete(key: 'user_data');
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
  Future<Either<Failure, String>> refreshToken(String refreshToken) async {
    try {
      final response = await _dio.post(
        '/auth/refresh',
        data: {
          'refreshToken': refreshToken,
        },
      );

      if (_isSuccess(response)) {
        // Store new tokens
        final accessToken = response.data['accessToken'];
        final newRefreshToken = response.data['refreshToken'];

        await _secureStorage.write(key: 'access_token', value: accessToken);
        await _secureStorage.write(
            key: 'refresh_token', value: newRefreshToken);

        return Right(accessToken);
      }

      // For non-successful responses, throw DioException to go through proper error mapping
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> sendOtpToEmail(String email) async {
    try {
      final response = await _dio.post(
        '/auth/send-pin-reset-otp',
        data: {
          'email': email,
        },
        options: Options(extra: {'requiresAuth': false}),
      );

      if (_isSuccess(response)) {
        return const Right(null);
      }

      // For non-successful responses, throw DioException to go through proper error mapping
      throw DioException(
        requestOptions: response.requestOptions,
        response: response,
        type: DioExceptionType.badResponse,
      );
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  bool _isSuccess(Response response) {
    return response.statusCode == 200 || response.statusCode == 201;
  }

  Failure _mapDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const NetworkFailure(
          'Connection timeout. Please check your internet connection.',
        );
      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final message = e.response?.data['message'] ?? 'An error occurred';

        if (statusCode == 401) {
          return UnauthorizedFailure(message);
        } else if (statusCode == 403) {
          return ForbiddenFailure(message);
        } else if (statusCode == 404) {
          return NotFoundFailure(message);
        } else if (statusCode! >= 500) {
          return ServerFailure(message);
        }
        return ServerFailure(message);
      case DioExceptionType.cancel:
        return const NetworkFailure('Request was cancelled.');
      case DioExceptionType.unknown:
        return const NetworkFailure('No internet connection.');
      default:
        return const ServerFailure('An unexpected error occurred.');
    }
  }
}
