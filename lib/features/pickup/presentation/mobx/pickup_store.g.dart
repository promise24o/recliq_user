// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pickup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PickupStore on _PickupStore, Store {
  Computed<bool>? _$hasActiveRequestComputed;

  @override
  bool get hasActiveRequest => (_$hasActiveRequestComputed ??= Computed<bool>(
          () => super.hasActiveRequest,
          name: '_PickupStore.hasActiveRequest'))
      .value;
  Computed<List<PickupRequest>>? _$activeRequestsComputed;

  @override
  List<PickupRequest> get activeRequests => (_$activeRequestsComputed ??=
          Computed<List<PickupRequest>>(() => super.activeRequests,
              name: '_PickupStore.activeRequests'))
      .value;
  Computed<List<PickupRequest>>? _$completedRequestsComputed;

  @override
  List<PickupRequest> get completedRequests => (_$completedRequestsComputed ??=
          Computed<List<PickupRequest>>(() => super.completedRequests,
              name: '_PickupStore.completedRequests'))
      .value;

  late final _$myRequestsAtom =
      Atom(name: '_PickupStore.myRequests', context: context);

  @override
  ObservableList<PickupRequest> get myRequests {
    _$myRequestsAtom.reportRead();
    return super.myRequests;
  }

  @override
  set myRequests(ObservableList<PickupRequest> value) {
    _$myRequestsAtom.reportWrite(value, super.myRequests, () {
      super.myRequests = value;
    });
  }

  late final _$availableAgentsAtom =
      Atom(name: '_PickupStore.availableAgents', context: context);

  @override
  ObservableList<AvailableAgent> get availableAgents {
    _$availableAgentsAtom.reportRead();
    return super.availableAgents;
  }

  @override
  set availableAgents(ObservableList<AvailableAgent> value) {
    _$availableAgentsAtom.reportWrite(value, super.availableAgents, () {
      super.availableAgents = value;
    });
  }

  late final _$agentsResponseAtom =
      Atom(name: '_PickupStore.agentsResponse', context: context);

  @override
  AvailableAgentsResponse? get agentsResponse {
    _$agentsResponseAtom.reportRead();
    return super.agentsResponse;
  }

  @override
  set agentsResponse(AvailableAgentsResponse? value) {
    _$agentsResponseAtom.reportWrite(value, super.agentsResponse, () {
      super.agentsResponse = value;
    });
  }

  late final _$activeRequestAtom =
      Atom(name: '_PickupStore.activeRequest', context: context);

  @override
  PickupRequest? get activeRequest {
    _$activeRequestAtom.reportRead();
    return super.activeRequest;
  }

  @override
  set activeRequest(PickupRequest? value) {
    _$activeRequestAtom.reportWrite(value, super.activeRequest, () {
      super.activeRequest = value;
    });
  }

  late final _$selectedRequestAtom =
      Atom(name: '_PickupStore.selectedRequest', context: context);

  @override
  PickupRequest? get selectedRequest {
    _$selectedRequestAtom.reportRead();
    return super.selectedRequest;
  }

  @override
  set selectedRequest(PickupRequest? value) {
    _$selectedRequestAtom.reportWrite(value, super.selectedRequest, () {
      super.selectedRequest = value;
    });
  }

  late final _$selectedAgentAtom =
      Atom(name: '_PickupStore.selectedAgent', context: context);

  @override
  AvailableAgent? get selectedAgent {
    _$selectedAgentAtom.reportRead();
    return super.selectedAgent;
  }

  @override
  set selectedAgent(AvailableAgent? value) {
    _$selectedAgentAtom.reportWrite(value, super.selectedAgent, () {
      super.selectedAgent = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_PickupStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isCreatingAtom =
      Atom(name: '_PickupStore.isCreating', context: context);

  @override
  bool get isCreating {
    _$isCreatingAtom.reportRead();
    return super.isCreating;
  }

  @override
  set isCreating(bool value) {
    _$isCreatingAtom.reportWrite(value, super.isCreating, () {
      super.isCreating = value;
    });
  }

  late final _$isLoadingAgentsAtom =
      Atom(name: '_PickupStore.isLoadingAgents', context: context);

  @override
  bool get isLoadingAgents {
    _$isLoadingAgentsAtom.reportRead();
    return super.isLoadingAgents;
  }

  @override
  set isLoadingAgents(bool value) {
    _$isLoadingAgentsAtom.reportWrite(value, super.isLoadingAgents, () {
      super.isLoadingAgents = value;
    });
  }

  late final _$errorAtom = Atom(name: '_PickupStore.error', context: context);

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$successMessageAtom =
      Atom(name: '_PickupStore.successMessage', context: context);

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$loadMyRequestsAsyncAction =
      AsyncAction('_PickupStore.loadMyRequests', context: context);

  @override
  Future<void> loadMyRequests() {
    return _$loadMyRequestsAsyncAction.run(() => super.loadMyRequests());
  }

  late final _$loadAvailableAgentsAsyncAction =
      AsyncAction('_PickupStore.loadAvailableAgents', context: context);

  @override
  Future<void> loadAvailableAgents({required double lat, required double lng}) {
    return _$loadAvailableAgentsAsyncAction
        .run(() => super.loadAvailableAgents(lat: lat, lng: lng));
  }

  late final _$createRequestAsyncAction =
      AsyncAction('_PickupStore.createRequest', context: context);

  @override
  Future<PickupRequest?> createRequest(
      {required String pickupMode,
      required String matchType,
      required String wasteType,
      required double estimatedWeight,
      required double lat,
      required double lng,
      required String address,
      String? notes,
      String? assignedAgentId,
      String? assignedAgentName}) {
    return _$createRequestAsyncAction.run(() => super.createRequest(
        pickupMode: pickupMode,
        matchType: matchType,
        wasteType: wasteType,
        estimatedWeight: estimatedWeight,
        lat: lat,
        lng: lng,
        address: address,
        notes: notes,
        assignedAgentId: assignedAgentId,
        assignedAgentName: assignedAgentName));
  }

  late final _$cancelRequestAsyncAction =
      AsyncAction('_PickupStore.cancelRequest', context: context);

  @override
  Future<void> cancelRequest({required String id, required String reason}) {
    return _$cancelRequestAsyncAction
        .run(() => super.cancelRequest(id: id, reason: reason));
  }

  late final _$_PickupStoreActionController =
      ActionController(name: '_PickupStore', context: context);

  @override
  void selectAgent(AvailableAgent? agent) {
    final _$actionInfo = _$_PickupStoreActionController.startAction(
        name: '_PickupStore.selectAgent');
    try {
      return super.selectAgent(agent);
    } finally {
      _$_PickupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearError() {
    final _$actionInfo = _$_PickupStoreActionController.startAction(
        name: '_PickupStore.clearError');
    try {
      return super.clearError();
    } finally {
      _$_PickupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearSuccess() {
    final _$actionInfo = _$_PickupStoreActionController.startAction(
        name: '_PickupStore.clearSuccess');
    try {
      return super.clearSuccess();
    } finally {
      _$_PickupStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
myRequests: ${myRequests},
availableAgents: ${availableAgents},
agentsResponse: ${agentsResponse},
activeRequest: ${activeRequest},
selectedRequest: ${selectedRequest},
selectedAgent: ${selectedAgent},
isLoading: ${isLoading},
isCreating: ${isCreating},
isLoadingAgents: ${isLoadingAgents},
error: ${error},
successMessage: ${successMessage},
hasActiveRequest: ${hasActiveRequest},
activeRequests: ${activeRequests},
completedRequests: ${completedRequests}
    ''';
  }
}
