import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import '../../domain/entities/pickup_request.dart';
import '../../domain/entities/available_agent.dart';
import '../../domain/repositories/pickup_repository.dart';
import '../../domain/usecases/create_pickup_request.dart';
import '../../domain/usecases/get_available_agents.dart';
import '../../domain/usecases/get_my_pickup_requests.dart';
import '../../domain/usecases/get_pickup_by_id.dart';
import '../../domain/usecases/cancel_pickup_request.dart';

part 'pickup_store.g.dart';

class PickupStore = _PickupStore with _$PickupStore;

abstract class _PickupStore with Store {
  final PickupRepository _repository;
  late final CreatePickupRequest _createPickupRequest;
  late final GetAvailableAgents _getAvailableAgents;
  late final GetMyPickupRequests _getMyPickupRequests;
  late final GetPickupById _getPickupById;
  late final CancelPickupRequest _cancelPickupRequest;

  _PickupStore({required PickupRepository repository})
      : _repository = repository {
    _createPickupRequest = CreatePickupRequest(_repository);
    _getAvailableAgents = GetAvailableAgents(_repository);
    _getMyPickupRequests = GetMyPickupRequests(_repository);
    _getPickupById = GetPickupById(_repository);
    _cancelPickupRequest = CancelPickupRequest(_repository);
  }

  @observable
  ObservableList<PickupRequest> myRequests = ObservableList<PickupRequest>();

  @observable
  ObservableList<AvailableAgent> availableAgents =
      ObservableList<AvailableAgent>();

  @observable
  AvailableAgentsResponse? agentsResponse;

  @observable
  PickupRequest? activeRequest;

  @observable
  PickupRequest? selectedRequest;

  @observable
  AvailableAgent? selectedAgent;

  @observable
  bool isLoading = false;

  @observable
  bool isCreating = false;

  @observable
  bool isLoadingAgents = false;

  @observable
  String? error;

  @observable
  String? successMessage;

  @computed
  bool get hasActiveRequest => myRequests.any(
        (r) =>
            r.status == 'new' ||
            r.status == 'matching' ||
            r.status == 'assigned' ||
            r.status == 'agent_en_route' ||
            r.status == 'arrived',
      );

  @computed
  List<PickupRequest> get activeRequests => myRequests
      .where((r) =>
          r.status == 'new' ||
          r.status == 'matching' ||
          r.status == 'assigned' ||
          r.status == 'agent_en_route' ||
          r.status == 'arrived')
      .toList();

  @computed
  List<PickupRequest> get completedRequests => myRequests
      .where((r) => r.status == 'completed' || r.status == 'cancelled')
      .toList();

  @action
  Future<void> loadMyRequests() async {
    isLoading = true;
    error = null;

    final result = await _getMyPickupRequests();
    result.fold(
      (failure) {
        error = failure.when(
          serverError: (msg) => msg ?? 'Failed to load pickups',
          networkError: (msg) => msg ?? 'No internet connection',
          invalidInput: (msg) => msg ?? 'Invalid request',
          unauthorized: (msg) => msg ?? 'Unauthorized',
          forbidden: (msg) => msg ?? 'Forbidden',
          notFound: (msg) => msg ?? 'Not found',
          cacheError: (msg) => msg ?? 'Cache error',
          biometricError: (msg) => msg ?? 'Biometric error',
          unexpected: (msg) => msg ?? 'Unexpected error',
        );
      },
      (requests) {
        myRequests = ObservableList.of(requests);
      },
    );

    isLoading = false;
  }

  @action
  Future<void> loadAvailableAgents({
    required double lat,
    required double lng,
  }) async {
    isLoadingAgents = true;
    error = null;

    final result = await _getAvailableAgents(lat: lat, lng: lng);
    result.fold(
      (failure) {
        error = failure.when(
          serverError: (msg) => msg ?? 'No agents available in your area',
          networkError: (msg) => msg ?? 'No internet connection',
          invalidInput: (msg) => msg ?? 'Invalid location',
          unauthorized: (msg) => msg ?? 'Unauthorized',
          forbidden: (msg) => msg ?? 'Forbidden',
          notFound: (msg) => msg ?? 'Not found',
          cacheError: (msg) => msg ?? 'Cache error',
          biometricError: (msg) => msg ?? 'Biometric error',
          unexpected: (msg) => msg ?? 'Unexpected error',
        );
        availableAgents.clear();
      },
      (response) {
        agentsResponse = response;
        availableAgents = ObservableList.of(response.agents);
      },
    );

    isLoadingAgents = false;
  }

  @action
  Future<PickupRequest?> createRequest({
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
    isCreating = true;
    error = null;
    successMessage = null;

    final result = await _createPickupRequest(
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

    PickupRequest? created;
    result.fold(
      (failure) {
        HapticFeedback.heavyImpact();
        error = failure.when(
          serverError: (msg) => msg ?? 'Failed to create pickup request',
          networkError: (msg) => msg ?? 'No internet connection',
          invalidInput: (msg) => msg ?? 'Invalid input',
          unauthorized: (msg) => msg ?? 'Unauthorized',
          forbidden: (msg) => msg ?? 'Forbidden',
          notFound: (msg) => msg ?? 'Not found',
          cacheError: (msg) => msg ?? 'Cache error',
          biometricError: (msg) => msg ?? 'Biometric error',
          unexpected: (msg) => msg ?? 'Unexpected error',
        );
      },
      (request) {
        HapticFeedback.lightImpact();
        created = request;
        activeRequest = request;
        myRequests.insert(0, request);
        successMessage = 'Pickup request created successfully!';
      },
    );

    isCreating = false;
    return created;
  }

  @action
  Future<void> cancelRequest({
    required String id,
    required String reason,
  }) async {
    isLoading = true;
    error = null;

    final result =
        await _cancelPickupRequest(id: id, reason: reason);
    result.fold(
      (failure) {
        error = failure.when(
          serverError: (msg) => msg ?? 'Failed to cancel pickup',
          networkError: (msg) => msg ?? 'No internet connection',
          invalidInput: (msg) => msg ?? 'Invalid request',
          unauthorized: (msg) => msg ?? 'Unauthorized',
          forbidden: (msg) => msg ?? 'Forbidden',
          notFound: (msg) => msg ?? 'Not found',
          cacheError: (msg) => msg ?? 'Cache error',
          biometricError: (msg) => msg ?? 'Biometric error',
          unexpected: (msg) => msg ?? 'Unexpected error',
        );
      },
      (updated) {
        final idx = myRequests.indexWhere((r) => r.id == id);
        if (idx != -1) myRequests[idx] = updated;
        if (activeRequest?.id == id) activeRequest = updated;
        successMessage = 'Pickup request cancelled.';
      },
    );

    isLoading = false;
  }

  @action
  void selectAgent(AvailableAgent? agent) {
    selectedAgent = agent;
  }

  @action
  void clearError() {
    error = null;
  }

  @action
  void clearSuccess() {
    successMessage = null;
  }
}
