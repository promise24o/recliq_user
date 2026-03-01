import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../mobx/pickup_store.dart';
import '../widgets/agent_selection_bottom_sheet.dart';
import '../widgets/pickup_confirmation_bottom_sheet.dart';
import 'my_pickups_page.dart';

const _kGoogleApiKey = 'AIzaSyA2keF1ucUSIKPC098o0T84LtKyI64Okh8';

class RequestPickupPage extends StatefulWidget {
  const RequestPickupPage({super.key});

  @override
  State<RequestPickupPage> createState() => _RequestPickupPageState();
}

class _RequestPickupPageState extends State<RequestPickupPage> {
  final PickupStore _pickupStore = getIt<PickupStore>();
  GoogleMapController? _mapController;

  LatLng _selectedLocation = const LatLng(6.4524, 3.4158);
  String _selectedAddress = 'Tap the map to set your location';
  String _selectedWasteType = 'plastic';
  String _selectedPickupMode = 'pickup';
  String _matchType = 'auto';
  final TextEditingController _notesController = TextEditingController();
  final TextEditingController _weightController =
      TextEditingController(text: '1.0');

  bool _isLoadingLocation = false;

  static const List<Map<String, dynamic>> _wasteTypes = [
    {'value': 'plastic', 'label': 'Plastic', 'icon': Icons.local_drink},
    {'value': 'paper', 'label': 'Paper', 'icon': Icons.description},
    {'value': 'metal', 'label': 'Metal', 'icon': Icons.hardware},
    {'value': 'glass', 'label': 'Glass', 'icon': Icons.wine_bar},
    {'value': 'organic', 'label': 'Organic', 'icon': Icons.eco},
    {'value': 'e_waste', 'label': 'E-Waste', 'icon': Icons.devices},
    {'value': 'mixed', 'label': 'Mixed', 'icon': Icons.recycling},
  ];

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _notesController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  Future<void> _openAddressSearch() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _AddressSearchSheet(
        initialLocation: _selectedLocation,
      ),
    );
    if (result != null && mounted) {
      setState(() {
        _selectedLocation = result['latLng'] as LatLng;
        _selectedAddress = result['address'] as String? ?? 'Selected location';
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_selectedLocation, 16),
      );
    }
  }

  Future<void> _getCurrentLocation() async {
    setState(() => _isLoadingLocation = true);
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        setState(() => _isLoadingLocation = false);
        return;
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          setState(() => _isLoadingLocation = false);
          return;
        }
      }
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _selectedLocation = LatLng(position.latitude, position.longitude);
        _selectedAddress = 'Your current location';
        _isLoadingLocation = false;
      });
      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(_selectedLocation, 15),
      );
    } catch (_) {
      setState(() => _isLoadingLocation = false);
    }
  }

  Future<void> _submitRequest() async {
    final weight = double.tryParse(_weightController.text);
    if (weight == null || weight <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a valid weight'),
          backgroundColor: AppTheme.danger,
        ),
      );
      return;
    }

    // If user selected "Choose Agent", show agent selection bottom sheet
    if (_matchType == 'user_selected') {
      _showAgentSelectionBottomSheet(weight);
      return;
    }

    // Auto matching - submit directly
    await _createPickupRequest(weight: weight);
  }

  void _showAgentSelectionBottomSheet(double weight) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AgentSelectionBottomSheet(
        pickupStore: _pickupStore,
        lat: _selectedLocation.latitude,
        lng: _selectedLocation.longitude,
        onAgentSelected: (agent) {
          Navigator.pop(context);
          _pickupStore.selectAgent(agent);
          _showConfirmationBottomSheet(weight: weight, agent: agent);
        },
      ),
    );
  }

  void _showConfirmationBottomSheet({
    required double weight,
    required dynamic agent,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => PickupConfirmationBottomSheet(
        selectedAgent: agent,
        wasteType: _selectedWasteType,
        estimatedWeight: weight,
        address: _selectedAddress,
        pickupMode: _selectedPickupMode,
        notes: _notesController.text.isEmpty ? null : _notesController.text,
        city: _pickupStore.agentsResponse?.city,
        zone: _pickupStore.agentsResponse?.zone,
        isLoading: _pickupStore.isCreating,
        onConfirm: () async {
          Navigator.pop(context);
          await _createPickupRequest(weight: weight);
        },
        onCancel: () {
          Navigator.pop(context);
          _pickupStore.selectAgent(null);
        },
      ),
    );
  }

  Future<void> _createPickupRequest({required double weight}) async {
    final result = await _pickupStore.createRequest(
      pickupMode: _selectedPickupMode,
      matchType: _matchType,
      wasteType: _selectedWasteType,
      estimatedWeight: weight,
      lat: _selectedLocation.latitude,
      lng: _selectedLocation.longitude,
      address: _selectedAddress,
      notes: _notesController.text.isEmpty ? null : _notesController.text,
      assignedAgentId: _pickupStore.selectedAgent?.agentId,
      assignedAgentName: _pickupStore.selectedAgent?.agentName,
    );

    if (!mounted) return;

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Pickup request created successfully!'),
          backgroundColor: AppTheme.primaryGreen,
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const MyPickupsPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_pickupStore.error ?? 'Failed to create pickup'),
          backgroundColor: AppTheme.danger,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => LoadingOverlay(
        isVisible: _pickupStore.isCreating,
        message: 'Creating pickup request...',
        child: Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: Stack(
            children: [
              // Google Map — full screen, bolt-like
              _buildMap(),

              // Top bar
              _buildTopBar(),

              // Bottom sheet panel
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _buildBottomPanel(),
              ),

              // Location loading indicator
              if (_isLoadingLocation)
                const Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: AppTheme.primaryGreen,
                      strokeWidth: 2,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMap() {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: _selectedLocation,
        zoom: 15,
      ),
      onMapCreated: (controller) {
        _mapController = controller;
        _mapController?.setMapStyle(_darkMapStyle);
      },
      onTap: (latLng) {
        setState(() {
          _selectedLocation = latLng;
          _selectedAddress =
              '${latLng.latitude.toStringAsFixed(4)}, ${latLng.longitude.toStringAsFixed(4)}';
        });
      },
      markers: {
        Marker(
          markerId: const MarkerId('pickup_location'),
          position: _selectedLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          infoWindow: InfoWindow(title: _selectedAddress),
        ),
      },
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      mapToolbarEnabled: false,
    );
  }

  Widget _buildTopBar() {
    return SafeArea(
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
              child: Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderSoft),
                ),
                child: GestureDetector(
                  onTap: _openAddressSearch,
                  child: Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: AppTheme.primaryGreen, size: 16),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          _selectedAddress,
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
            const SizedBox(width: 8),
            GestureDetector(
              onTap: _getCurrentLocation,
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.surfaceDark,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.borderSoft),
                ),
                child: const Icon(Icons.my_location,
                    color: AppTheme.primaryGreen, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomPanel() {
    return Container(
      decoration: const BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Drag handle
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Request Pickup',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const MyPickupsPage()),
                  ),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppTheme.primaryGreen.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: AppTheme.primaryGreen.withOpacity(0.4)),
                    ),
                    child: const Text(
                      'My Pickups',
                      style: TextStyle(
                        color: AppTheme.primaryGreen,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Pickup Mode
            _buildSectionLabel('Pickup Mode'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildToggleChip(
                  label: 'Pickup',
                  icon: Icons.directions_car,
                  selected: _selectedPickupMode == 'pickup',
                  onTap: () =>
                      setState(() => _selectedPickupMode = 'pickup'),
                ),
                const SizedBox(width: 10),
                _buildToggleChip(
                  label: 'Drop-off',
                  icon: Icons.store,
                  selected: _selectedPickupMode == 'dropoff',
                  onTap: () =>
                      setState(() => _selectedPickupMode = 'dropoff'),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Match Type
            _buildSectionLabel('Agent Matching'),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildToggleChip(
                  label: 'Auto',
                  icon: Icons.flash_on,
                  selected: _matchType == 'auto',
                  onTap: () => setState(() {
                    _matchType = 'auto';
                    _pickupStore.selectAgent(null);
                  }),
                ),
                const SizedBox(width: 10),
                _buildToggleChip(
                  label: 'Choose Agent',
                  icon: Icons.person_search,
                  selected: _matchType == 'user_selected',
                  onTap: () {
                    setState(() {
                      _matchType = 'user_selected';
                      _pickupStore.selectAgent(null);
                    });
                  },
                ),
              ],
            ),

            // Show selected agent chip
            if (_matchType == 'user_selected' &&
                _pickupStore.selectedAgent != null) ...[
              const SizedBox(height: 8),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppTheme.primaryGreen.withOpacity(0.4)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle,
                        color: AppTheme.primaryGreen, size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        '${_pickupStore.selectedAgent!.agentName} • ${_pickupStore.selectedAgent!.estimatedArrivalTime} min away',
                        style: const TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _pickupStore.selectAgent(null);
                        setState(() {});
                      },
                      child: const Icon(Icons.close,
                          color: AppTheme.textMuted, size: 16),
                    ),
                  ],
                ),
              ),
            ],
            const SizedBox(height: 16),

            // Waste Type
            _buildSectionLabel('Waste Type'),
            const SizedBox(height: 8),
            SizedBox(
              height: 72,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _wasteTypes.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (_, i) {
                  final type = _wasteTypes[i];
                  final selected = _selectedWasteType == type['value'];
                  return GestureDetector(
                    onTap: () =>
                        setState(() => _selectedWasteType = type['value']),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 72,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppTheme.primaryGreen.withOpacity(0.15)
                            : AppTheme.darkBackground,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selected
                              ? AppTheme.primaryGreen
                              : AppTheme.borderSoft,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            type['icon'] as IconData,
                            color: selected
                                ? AppTheme.primaryGreen
                                : AppTheme.textMuted,
                            size: 20,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            type['label'] as String? ?? '',
                            style: TextStyle(
                              color: selected
                                  ? AppTheme.primaryGreen
                                  : AppTheme.textMuted,
                              fontSize: 10,
                              fontWeight: selected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),

            // Estimated Weight
            _buildSectionLabel('Estimated Weight (kg)'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _weightController,
              hint: 'e.g. 5.2',
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              prefixIcon: Icons.scale,
            ),
            const SizedBox(height: 16),

            // Notes
            _buildSectionLabel('Notes (Optional)'),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _notesController,
              hint: 'e.g. Gate code: #1234',
              keyboardType: TextInputType.text,
              prefixIcon: Icons.notes,
              maxLines: 2,
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: Observer(
                builder: (_) => ElevatedButton(
                  onPressed: _pickupStore.isCreating ? null : _submitRequest,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryGreen,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _pickupStore.isCreating
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Request Pickup',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: AppTheme.textSecondary,
        fontSize: 13,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildToggleChip({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryGreen.withOpacity(0.15)
              : AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: selected ? AppTheme.primaryGreen : AppTheme.borderSoft,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected ? AppTheme.primaryGreen : AppTheme.textMuted,
              size: 16,
            ),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                color:
                    selected ? AppTheme.primaryGreen : AppTheme.textSecondary,
                fontSize: 13,
                fontWeight:
                    selected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required TextInputType keyboardType,
    required IconData prefixIcon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 14),
          prefixIcon: Icon(prefixIcon, color: AppTheme.textMuted, size: 18),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ),
      ),
    );
  }
}

class _AddressSearchSheet extends StatefulWidget {
  final LatLng initialLocation;

  const _AddressSearchSheet({required this.initialLocation});

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
          // Handle
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

          // Header
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
                  'Set Pickup Location',
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

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.5)),
              ),
              child: TextField(
                controller: _searchController,
                focusNode: _focusNode,
                style: const TextStyle(
                    color: AppTheme.textPrimary, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'Search address or place...',
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

          // Use current location button
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

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(child: Divider(color: AppTheme.borderSoft)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'SUGGESTIONS',
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

          // Results
          Expanded(
            child: _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppTheme.primaryGreen, strokeWidth: 2))
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
            const Icon(Icons.north_west,
                color: AppTheme.textMuted, size: 14),
          ],
        ),
      ),
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
              'Type to search for an address',
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
          const SizedBox(height: 4),
          const Text(
            'Try a different search term',
            style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
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
  {"featureType":"administrative.country","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},
  {"featureType":"administrative.land_parcel","elementType":"labels.text.fill","stylers":[{"color":"#64779e"}]},
  {"featureType":"administrative.province","elementType":"geometry.stroke","stylers":[{"color":"#4b6878"}]},
  {"featureType":"landscape.man_made","elementType":"geometry.stroke","stylers":[{"color":"#334e87"}]},
  {"featureType":"landscape.natural","elementType":"geometry","stylers":[{"color":"#023e58"}]},
  {"featureType":"poi","elementType":"geometry","stylers":[{"color":"#283d6a"}]},
  {"featureType":"poi","elementType":"labels.text.fill","stylers":[{"color":"#6f9ba5"}]},
  {"featureType":"poi","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},
  {"featureType":"poi.park","elementType":"geometry.fill","stylers":[{"color":"#023e58"}]},
  {"featureType":"poi.park","elementType":"labels.text.fill","stylers":[{"color":"#3C7680"}]},
  {"featureType":"road","elementType":"geometry","stylers":[{"color":"#304a7d"}]},
  {"featureType":"road","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},
  {"featureType":"road","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},
  {"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#2c6675"}]},
  {"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#255763"}]},
  {"featureType":"road.highway","elementType":"labels.text.fill","stylers":[{"color":"#b0d5ce"}]},
  {"featureType":"road.highway","elementType":"labels.text.stroke","stylers":[{"color":"#023747"}]},
  {"featureType":"transit","elementType":"labels.text.fill","stylers":[{"color":"#98a5be"}]},
  {"featureType":"transit","elementType":"labels.text.stroke","stylers":[{"color":"#1d2c4d"}]},
  {"featureType":"transit.line","elementType":"geometry.fill","stylers":[{"color":"#283d6a"}]},
  {"featureType":"transit.station","elementType":"geometry","stylers":[{"color":"#3a4762"}]},
  {"featureType":"water","elementType":"geometry","stylers":[{"color":"#0e1626"}]},
  {"featureType":"water","elementType":"labels.text.fill","stylers":[{"color":"#4e6d70"}]}
]
''';
