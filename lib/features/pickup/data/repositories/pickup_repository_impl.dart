import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/pickup_request.dart';
import '../../domain/entities/available_agent.dart';
import '../../domain/repositories/pickup_repository.dart';
import '../datasources/pickup_remote_datasource.dart';

class PickupRepositoryImpl implements PickupRepository {
  final PickupRemoteDataSource _remoteDataSource;

  PickupRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<Failure, PickupRequest>> createPickupRequest({
    required String pickupMode,
    required String matchType,
    required String wasteType,
    required double estimatedWeight,
    required double lat,
    required double lng,
    required String address,
    String? notes,
    String? assignedAgentId,
    String? assignedAgentName,
  }) async {
    try {
      final result = await _remoteDataSource.createPickupRequest(
        pickupMode: pickupMode,
        matchType: matchType,
        wasteType: wasteType,
        estimatedWeight: estimatedWeight,
        lat: lat,
        lng: lng,
        address: address,
        notes: notes,
        assignedAgentId: assignedAgentId,
        assignedAgentName: assignedAgentName,
      );
      return Right(result);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] as String? ?? e.message;
      return Left(Failure.serverError(msg));
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, AvailableAgentsResponse>> getAvailableAgents({
    required double lat,
    required double lng,
  }) async {
    try {
      final result =
          await _remoteDataSource.getAvailableAgents(lat: lat, lng: lng);
      return Right(result);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] as String? ?? e.message;
      return Left(Failure.serverError(msg ?? 'Unknown error'));
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PickupRequest>>> getMyRequests() async {
    try {
      final result = await _remoteDataSource.getMyRequests();
      return Right(result);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] as String? ?? e.message;
      return Left(Failure.serverError(msg));
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PickupRequest>> getPickupById(String id) async {
    try {
      final result = await _remoteDataSource.getPickupById(id);
      return Right(result);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] as String? ?? e.message;
      return Left(Failure.serverError(msg));
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }

  @override
  Future<Either<Failure, PickupRequest>> cancelPickupRequest({
    required String id,
    required String reason,
  }) async {
    try {
      final result =
          await _remoteDataSource.cancelPickupRequest(id: id, reason: reason);
      return Right(result);
    } on DioException catch (e) {
      final msg = e.response?.data?['message'] as String? ?? e.message;
      return Left(Failure.serverError(msg));
    } catch (e) {
      return Left(Failure.serverError(e.toString()));
    }
  }
}
