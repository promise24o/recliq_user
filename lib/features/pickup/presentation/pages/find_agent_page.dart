import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../shared/themes/app_theme.dart';
import '../../domain/entities/available_agent.dart';
import '../mobx/pickup_store.dart';
import '../../data/datasources/recent_search_local_data_source.dart';

const _kGoogleApiKey = 'AIzaSyA2keF1ucUSIKPC098o0T84LtKyI64Okh8';

class FindAgentPage extends StatefulWidget {
  final double lat;
  final double lng;
  final PickupStore pickupStore;

  const FindAgentPage({
    super.key,
    required this.lat,
    required this.lng,
    required this.pickupStore,
  });

  @override
  State<FindAgentPage> createState() => _FindAgentPageState();
}

class _FindAgentPageState extends State<FindAgentPage> {
  GoogleMapController? _mapController;
  late double _searchLat;
  late double _searchLng;
  String _searchAddress = 'Current location';
  late final RecentSearchLocalDataSource _recentSearchDataSource;
  List<RecentSearchLocation> _recentSearches = [];

  @override
  void initState() {
    super.initState();
    _searchLat = widget.lat;
    _searchLng = widget.lng;
    _recentSearchDataSource = GetIt.instance<RecentSearchLocalDataSource>();
    _loadRecentSearches();
    widget.pickupStore.loadAvailableAgents(
      lat: _searchLat,
      lng: _searchLng,
    );
  }

  Future<void> _loadRecentSearches() async {
    _recentSearches = await _recentSearchDataSource.getRecentSearches();
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _openAddressSearch() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddressSearchSheet(
        initialLocation: LatLng(_searchLat, _searchLng),
        recentLocations: _recentSearches,
      ),
    );
    if (result != null && mounted) {
      final latLng = result['latLng'] as LatLng;
      final address = result['address'] as String? ?? 'Selected location';
      setState(() {
        _searchLat = latLng.latitude;
        _searchLng = latLng.longitude;
        _searchAddress = address;
      });
      
      // Save to local data source
      await _recentSearchDataSource.addRecentSearch(
        RecentSearchLocation(
          address: address,
          lat: latLng.latitude,
          lng: latLng.longitude,
        ),
      );
      
      // Reload recent searches
      _loadRecentSearches();
      
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(latLng, 14),
      );
      widget.pickupStore.loadAvailableAgents(
        lat: _searchLat,
        lng: _searchLng,
      );
    }
  }

  Set<Marker> _buildMarkers(List<AvailableAgent> agents) {
    final markers = <Marker>{};

    // Agent markers with custom car icon
    for (final agent in agents) {
      final isSelected = widget.pickupStore.selectedAgent?.agentId == agent.agentId;
      markers.add(
        Marker(
          markerId: MarkerId(agent.agentId),
          position: LatLng(
            agent.currentLocation.lat,
            agent.currentLocation.lng,
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            isSelected
                ? BitmapDescriptor.hueBlue
                : BitmapDescriptor.hueYellow,
          ),
          infoWindow: InfoWindow(
            title: agent.agentName,
            snippet: '${agent.distance.toStringAsFixed(1)} km • ${agent.estimatedArrivalTime} min',
          ),
          onTap: () {
            widget.pickupStore.selectAgent(agent);
            setState(() {});
          },
        ),
      );
    }

    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: Observer(
        builder: (_) {
          final agents = widget.pickupStore.availableAgents;
          return Stack(
            children: [
              // Full screen Google Map
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(_searchLat, _searchLng),
                  zoom: 14,
                ),
                onMapCreated: (controller) {
                  _mapController = controller;
                  _mapController?.setMapStyle(_darkMapStyle);
                },
                markers: _buildMarkers(agents),
                myLocationEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
              ),

              // Top bar
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceDark,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppTheme.borderSoft),
                          ),
                          child: const Icon(Icons.arrow_back,
                              color: AppTheme.textPrimary, size: 20),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: _openAddressSearch,
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceDark,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppTheme.borderSoft),
                            ),
                            child: Row(
                              children: [
                                const Icon(Icons.location_on,
                                    color: AppTheme.primaryGreen, size: 16),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    _searchAddress,
                                    style: const TextStyle(
                                      color: AppTheme.textSecondary,
                                      fontSize: 13,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const Icon(Icons.keyboard_arrow_down,
                                    color: AppTheme.textMuted, size: 18),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Loading indicator
              if (widget.pickupStore.isLoadingAgents)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppTheme.primaryGreen,
                  ),
                ),

              // Error state
              if (widget.pickupStore.error != null && !widget.pickupStore.isLoadingAgents)
                Positioned(
                  top: 110,
                  left: 16,
                  right: 16,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.danger.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.danger.withOpacity(0.4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.warning_amber_rounded,
                            color: AppTheme.danger, size: 16),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            widget.pickupStore.error!,
                            style: const TextStyle(
                              color: AppTheme.danger,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              // Bottom agent list
              if (!widget.pickupStore.isLoadingAgents)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: _buildAgentListPanel(agents),
                ),

              // Retry button uses updated coords
              if (agents.isEmpty && !widget.pickupStore.isLoadingAgents)
                const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }

  Widget _buildAgentListPanel(List<AvailableAgent> agents) {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  agents.isEmpty
                      ? 'No Agents Available'
                      : '${agents.length} Agents Nearby',
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (agents.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      widget.pickupStore.agentsResponse?.zone ??
                          (widget.pickupStore.agentsResponse?.city ?? ''),
                      style: const TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (agents.isEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
              child: Column(
                children: [
                  Icon(Icons.person_off,
                      color: AppTheme.textMuted, size: 48),
                  const SizedBox(height: 8),
                  const Text(
                    'No available agents found in your area\nat the moment. Please try again later.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: AppTheme.textMuted, fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => widget.pickupStore.loadAvailableAgents(
                        lat: _searchLat,
                        lng: _searchLng,
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppTheme.primaryGreen),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Retry',
                        style: TextStyle(color: AppTheme.primaryGreen),
                      ),
                    ),
                  ),
                  const SizedBox(height:40)
                ],
              ),
            )
          else
            SizedBox(
              height: 260,
              child: ListView.separated(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                itemCount: agents.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (_, i) => _buildAgentCard(agents[i]),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildAgentCard(AvailableAgent agent) {
    final isSelected =
        widget.pickupStore.selectedAgent?.agentId == agent.agentId;

    return GestureDetector(
      onTap: () {
        widget.pickupStore.selectAgent(agent);
        setState(() {});
        _mapController?.animateCamera(
          CameraUpdate.newLatLngZoom(
            LatLng(agent.currentLocation.lat, agent.currentLocation.lng),
            15,
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.primaryGreen.withOpacity(0.1)
              : AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color:
                isSelected ? AppTheme.primaryGreen : AppTheme.borderSoft,
            width: isSelected ? 1.5 : 1,
          ),
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.primaryGreen.withOpacity(0.2)
                    : AppTheme.surfaceDark,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppTheme.primaryGreen
                      : AppTheme.borderSoft,
                ),
              ),
              child: Icon(
                Icons.person,
                color:
                    isSelected ? AppTheme.primaryGreen : AppTheme.textMuted,
                size: 22,
              ),
            ),
            const SizedBox(width: 12),

            // Agent info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    agent.agentName,
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.directions_car,
                          color: AppTheme.textMuted, size: 12),
                      const SizedBox(width: 4),
                      Text(
                        agent.vehicleType,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.location_on,
                          color: AppTheme.textMuted, size: 12),
                      const SizedBox(width: 2),
                      Text(
                        '${agent.distance.toStringAsFixed(1)} km',
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // ETA + Rating + Selection
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${agent.estimatedArrivalTime} min',
                    style: const TextStyle(
                      color: AppTheme.primaryGreen,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star,
                        color: Color(0xFFFF9F0A), size: 12),
                    const SizedBox(width: 2),
                    Text(
                      agent.rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: AppTheme.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                  ],
                ),
                if (isSelected) ...[
                  const SizedBox(height: 4),
                  const Icon(Icons.check_circle,
                      color: AppTheme.primaryGreen, size: 16),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressSearchSheet extends StatefulWidget {
  final LatLng initialLocation;
  final List<RecentSearchLocation> recentLocations;

  const _AddressSearchSheet({
    required this.initialLocation,
    this.recentLocations = const [],
  });

  @override
  State<_AddressSearchSheet> createState() => _AddressSearchSheetState();
}

class _AddressSearchSheetState extends State<_AddressSearchSheet> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final Dio _dio = Dio();

  List<Map<String, dynamic>> _suggestions = [];
  bool _isLoading = false;
  String? _sessionToken;

  @override
  void initState() {
    super.initState();
    _sessionToken = DateTime.now().millisecondsSinceEpoch.toString();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _dio.close();
    super.dispose();
  }

  Future<void> _fetchSuggestions(String input) async {
    if (input.trim().isEmpty) {
      setState(() => _suggestions = []);
      return;
    }
    setState(() => _isLoading = true);
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: {
          'input': input,
          'key': _kGoogleApiKey,
          'sessiontoken': _sessionToken,
          'location':
              '${widget.initialLocation.latitude},${widget.initialLocation.longitude}',
          'radius': 50000,
          'language': 'en',
        },
      );
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 'OK') {
        final predictions = data['predictions'] as List<dynamic>;
        setState(() {
          _suggestions = predictions
              .map((p) => {
                    'placeId': (p['place_id'] as String? ?? ''),
                    'mainText': (p['structured_formatting']
                            ?['main_text'] as String?) ??
                        (p['description'] as String? ?? ''),
                    'secondaryText': (p['structured_formatting']
                            ?['secondary_text'] as String?) ??
                        '',
                  })
              .toList();
        });
      } else {
        setState(() => _suggestions = []);
      }
    } catch (_) {
      setState(() => _suggestions = []);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _selectPlace(Map<String, dynamic> place) async {
    setState(() => _isLoading = true);
    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: {
          'place_id': place['placeId'] as String? ?? '',
          'fields': 'geometry,formatted_address',
          'key': _kGoogleApiKey,
          'sessiontoken': _sessionToken,
        },
      );
      final data = response.data as Map<String, dynamic>;
      if (data['status'] == 'OK') {
        final result = data['result'] as Map<String, dynamic>;
        final location =
            result['geometry']['location'] as Map<String, dynamic>;
        final lat = (location['lat'] as num).toDouble();
        final lng = (location['lng'] as num).toDouble();
        final address = result['formatted_address'] as String? ?? 'Selected location';
        if (mounted) {
          Navigator.pop(context, {
            'latLng': LatLng(lat, lng),
            'address': address,
          });
        }
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  void _useCurrentLocation() async {
    setState(() => _isLoading = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _isLoading = false);
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _isLoading = false);
          return;
        }
      }
      final position = await Geolocator.getCurrentPosition();
      if (mounted) {
        Navigator.pop(context, {
          'latLng': LatLng(position.latitude, position.longitude),
          'address': 'My current location',
        });
      }
    } catch (_) {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;
    return Container(
      height: MediaQuery.of(context).size.height * 0.92,
      decoration: const BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppTheme.borderSoft,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppTheme.borderSoft),
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: AppTheme.textPrimary, size: 18),
                  ),
                ),
                const SizedBox(width: 12),
                const Text(
                  'Search Location',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(14),
                border:
                    Border.all(color: AppTheme.primaryGreen.withOpacity(0.5)),
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                style: const TextStyle(
                    color: AppTheme.textPrimary, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search address or area...',
                  hintStyle: const TextStyle(
                      color: AppTheme.textMuted, fontSize: 15),
                  prefixIcon: const Icon(Icons.search,
                      color: AppTheme.primaryGreen, size: 20),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? GestureDetector(
                          onTap: () {
                            _searchController.clear();
                            setState(() => _suggestions = []);
                          },
                          child: const Icon(Icons.close,
                              color: AppTheme.textMuted, size: 18),
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 14),
                ),
                onChanged: (v) {
                  setState(() {});
                  _fetchSuggestions(v);
                },
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: _useCurrentLocation,
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                      color: AppTheme.primaryGreen.withOpacity(0.25)),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryGreen.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.my_location,
                          color: AppTheme.primaryGreen, size: 18),
                    ),
                    const SizedBox(width: 12),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Use current location',
                          style: TextStyle(
                            color: AppTheme.primaryGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'GPS auto-detect',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.chevron_right,
                        color: AppTheme.primaryGreen, size: 18),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Divider(color: AppTheme.borderSoft)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    _searchController.text.isEmpty && widget.recentLocations.isNotEmpty
                        ? 'RECENT SEARCHES'
                        : 'SUGGESTIONS',
                    style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 11,
                        letterSpacing: 1.2),
                  ),
                ),
                Expanded(child: Divider(color: AppTheme.borderSoft)),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppTheme.primaryGreen, strokeWidth: 2))
                : _searchController.text.isEmpty && widget.recentLocations.isNotEmpty
                    ? _buildRecentSearchesList(bottomInset)
                    : _suggestions.isEmpty
                        ? _buildEmptyState()
                        : ListView.separated(
                            padding: EdgeInsets.fromLTRB(
                                20, 4, 20, bottomInset + 24),
                            itemCount: _suggestions.length,
                            separatorBuilder: (_, __) => const Divider(
                                color: AppTheme.borderSoft, height: 1),
                            itemBuilder: (_, i) =>
                                _buildSuggestionTile(_suggestions[i]),
                          ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuggestionTile(Map<String, dynamic> place) {
    return GestureDetector(
      onTap: () => _selectPlace(place),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppTheme.borderSoft),
              ),
              child: const Icon(Icons.location_on_outlined,
                  color: AppTheme.textMuted, size: 18),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['mainText'] as String? ?? '',
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if ((place['secondaryText'] as String? ?? '').isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      place['secondaryText'] as String? ?? '',
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
            const Icon(Icons.north_west, color: AppTheme.textMuted, size: 14),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentSearchesList(double bottomInset) {
    return ListView.separated(
      padding: EdgeInsets.fromLTRB(20, 4, 20, bottomInset + 24),
      itemCount: widget.recentLocations.length,
      separatorBuilder: (_, __) => const Divider(color: AppTheme.borderSoft, height: 1),
      itemBuilder: (_, i) {
        final location = widget.recentLocations[i];
        return GestureDetector(
          onTap: () {
            Navigator.pop(context, {
              'latLng': LatLng(location.lat, location.lng),
              'address': location.address,
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppTheme.primaryGreen.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.history,
                      color: AppTheme.primaryGreen, size: 18),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location.address,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.north_west, color: AppTheme.textMuted, size: 14),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    if (_searchController.text.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search,
                color: AppTheme.textMuted.withOpacity(0.4), size: 56),
            const SizedBox(height: 12),
            const Text(
              'Type to search for a location',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
            ),
          ],
        ),
      );
    }
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.location_off,
              color: AppTheme.textMuted.withOpacity(0.4), size: 56),
          const SizedBox(height: 12),
          const Text(
            'No results found',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
          ),
        ],
      ),
    );
  }
}

const String _darkMapStyle = '''
[
  {"elementType":"geometry","stylers":[{"color":"#1d2c4d"}]},
  {"elementType":"labels.text.fill","stylers":[{"color":"#8ec3b9"}]},
  {"elementType":"labels.text.stroke","stylers":[{"color":"#1a3646"}]},
  {"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},
  {"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},
  {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},
  {"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}
]
''';
