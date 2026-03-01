import 'package:dio/dio.dart';
import '../../domain/entities/pickup_request.dart';
import '../../domain/entities/available_agent.dart';

abstract class PickupRemoteDataSource {
  Future<PickupRequest> createPickupRequest({
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
  });

  Future<AvailableAgentsResponse> getAvailableAgents({
    required double lat,
    required double lng,
  });

  Future<List<PickupRequest>> getMyRequests();

  Future<PickupRequest> getPickupById(String id);

  Future<PickupRequest> cancelPickupRequest({
    required String id,
    required String reason,
  });
}

class PickupRemoteDataSourceImpl implements PickupRemoteDataSource {
  final Dio _dio;

  PickupRemoteDataSourceImpl(this._dio);

  @override
  Future<PickupRequest> createPickupRequest({
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
    final Map<String, dynamic> data = {
      'pickupMode': pickupMode,
      'matchType': matchType,
      'wasteType': wasteType,
      'estimatedWeight': estimatedWeight,
      'coordinates': {'lat': lat, 'lng': lng},
      'address': address,
    };
    if (notes != null) data['notes'] = notes;
    if (assignedAgentId != null) data['assignedAgentId'] = assignedAgentId;
    if (assignedAgentName != null) data['assignedAgentName'] = assignedAgentName;

    final response = await _dio.post(
      '/pickup',
      data: data,
      options: Options(extra: {'requiresAuth': true}),
    );

    return PickupRequest.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<AvailableAgentsResponse> getAvailableAgents({
    required double lat,
    required double lng,
  }) async {
    final response = await _dio.get(
      '/pickup/available-agents',
      queryParameters: {'lat': lat, 'lng': lng},
      options: Options(extra: {'requiresAuth': true}),
    );

    return AvailableAgentsResponse.fromJson(
        response.data as Map<String, dynamic>);
  }

  @override
  Future<List<PickupRequest>> getMyRequests() async {
    final response = await _dio.get(
      '/pickup/my-requests',
      options: Options(extra: {'requiresAuth': true}),
    );

    final List<dynamic> list = response.data as List<dynamic>;
    return list
        .map((e) => PickupRequest.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Future<PickupRequest> getPickupById(String id) async {
    final response = await _dio.get(
      '/pickup/$id',
      options: Options(extra: {'requiresAuth': true}),
    );

    return PickupRequest.fromJson(response.data as Map<String, dynamic>);
  }

  @override
  Future<PickupRequest> cancelPickupRequest({
    required String id,
    required String reason,
  }) async {
    final response = await _dio.patch(
      '/pickup/$id/cancel',
      data: {'reason': reason},
      options: Options(extra: {'requiresAuth': true}),
    );

    return PickupRequest.fromJson(response.data as Map<String, dynamic>);
  }
}
