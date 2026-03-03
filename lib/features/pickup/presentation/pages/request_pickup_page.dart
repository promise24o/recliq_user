import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/di/service_locator.dart';
import '../../../../shared/themes/app_theme.dart';
import '../../../../shared/widgets/loading_overlay.dart';
import '../mobx/pickup_store.dart';
import '../widgets/agent_selection_bottom_sheet.dart';
import '../widgets/pickup_confirmation_bottom_sheet.dart';
import '../widgets/place_search_sheet.dart';
import 'my_pickups_page.dart';

class RequestPickupPage extends StatefulWidget {
  const RequestPickupPage({super.key});

  @override
  State<RequestPickupPage> createState() => _RequestPickupPageState();
}

class _RequestPickupPageState extends State<RequestPickupPage> {
  final PickupStore _store = getIt<PickupStore>();
  GoogleMapController? _mapController;

  LatLng _location = const LatLng(6.4524, 3.4158);
  String _address = 'Tap map to choose location';
  String _wasteType = 'plastic';
  String _pickupMode = 'pickup';
  String _matchType = 'auto';

  final _notesCtrl = TextEditingController();
  final _weightCtrl = TextEditingController(text: '1.0');

  bool _locating = false;

  static const _wasteOptions = [
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
    _getCurrentPosition();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    _notesCtrl.dispose();
    _weightCtrl.dispose();
    super.dispose();
  }

  Future<void> _getCurrentPosition() async {
    setState(() => _locating = true);

    try {
      if (!await Geolocator.isLocationServiceEnabled()) return;
      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
        if (perm == LocationPermission.denied) return;
      }

      final pos = await Geolocator.getCurrentPosition();
      setState(() {
        _location = LatLng(pos.latitude, pos.longitude);
        _address = 'Current location';
      });
      _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_location, 15));
    } catch (_) {
      // silent fail or show toast
    } finally {
      if (mounted) setState(() => _locating = false);
    }
  }

  Future<void> _openPlacePicker() async {
    final result = await showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => PlaceSearchSheet(initialLocation: _location),
    );

    if (result != null && mounted) {
      setState(() {
        _location = result['latLng'] as LatLng;
        _address = result['address'] as String? ?? 'Selected place';
      });
      _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_location, 16));
    }
  }

  Future<void> _submit() async {
    final weight = double.tryParse(_weightCtrl.text.trim());
    if (weight == null || weight <= 0) {
      _showSnack('Please enter valid weight', AppTheme.danger);
      return;
    }

    if (_matchType == 'user_selected') {
      _showAgentSelector(weight);
      return;
    }

    await _createRequest(weight);
  }

  void _showAgentSelector(double weight) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => AgentSelectionBottomSheet(
        pickupStore: _store,
        lat: _location.latitude,
        lng: _location.longitude,
        onAgentSelected: (agent) {
          Navigator.pop(context);
          _store.selectAgent(agent);
          _showConfirmation(weight, agent);
        },
      ),
    );
  }

  void _showConfirmation(double weight, dynamic agent) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (_) => PickupConfirmationBottomSheet(
        selectedAgent: agent,
        wasteType: _wasteType,
        estimatedWeight: weight,
        address: _address,
        pickupMode: _pickupMode,
        notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
        city: _store.agentsResponse?.city,
        zone: _store.agentsResponse?.zone,
        isLoading: _store.isCreating,
        onConfirm: () async {
          Navigator.pop(context);
          await _createRequest(weight);
        },
        onCancel: () {
          Navigator.pop(context);
          _store.selectAgent(null);
        },
      ),
    );
  }

  Future<void> _createRequest(double weight) async {
    final result = await _store.createRequest(
      pickupMode: _pickupMode,
      matchType: _matchType,
      wasteType: _wasteType,
      estimatedWeight: weight,
      lat: _location.latitude,
      lng: _location.longitude,
      address: _address,
      notes: _notesCtrl.text.trim().isEmpty ? null : _notesCtrl.text.trim(),
      assignedAgentId: _store.selectedAgent?.agentId,
      assignedAgentName: _store.selectedAgent?.agentName,
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
      _showSnack(_store.error ?? 'Failed to create request', AppTheme.danger);
    }
  }

  void _showSnack(String msg, Color bg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(msg), backgroundColor: bg),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Observer(
      builder: (_) => LoadingOverlay(
        isVisible: _store.isCreating,
        message: 'Creating request…',
        child: Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: Stack(
            children: [
              // ── Map (fullscreen) ────────────────────────
              GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: _location, zoom: 15),
                onMapCreated: (ctrl) {
                  _mapController = ctrl;
                  ctrl.setMapStyle(_darkMapStyle);
                },
                onTap: (pos) {
                  setState(() {
                    _location = pos;
                    _address =
                        '${pos.latitude.toStringAsFixed(5)}, ${pos.longitude.toStringAsFixed(5)}';
                  });
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('pickup'),
                    position: _location,
                    icon: BitmapDescriptor.defaultMarkerWithHue(
                        BitmapDescriptor.hueGreen),
                    infoWindow: InfoWindow(title: _address),
                  ),
                },
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                zoomControlsEnabled: false,
                mapToolbarEnabled: false,
              ),

              // ── Top bar (overlay on map) ─────────────────────
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                  child: Row(
                    children: [
                      _circleButton(Icons.arrow_back,
                          onTap: () => Navigator.pop(context)),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: _openPlacePicker,
                          child: _locationChip(_address),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _circleButton(Icons.my_location,
                          onTap: _getCurrentPosition),
                    ],
                  ),
                ),
              ),

              // ── Bottom sheet ────────────────────────
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.58,
                  decoration: const BoxDecoration(
                    color: AppTheme.surfaceDark,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(28)),
                  ),
                  child: Column(
                    children: [
                      // handle
                      Padding(
                        padding: const EdgeInsets.only(top: 12, bottom: 8),
                        child: Container(
                          width: 42,
                          height: 5,
                          decoration: BoxDecoration(
                            color: AppTheme.borderSoft,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 4, 20, 32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Request Pickup',
                                    style: TextStyle(
                                      fontSize: 21,
                                      fontWeight: FontWeight.w700,
                                      color: AppTheme.textPrimary,
                                    ),
                                  ),
                                  _myPickupsButton(),
                                ],
                              ),
                              const SizedBox(height: 20),
                              _sectionLabel('Pickup Mode'),
                              const SizedBox(height: 8),
                              _toggleRow(
                                items: [
                                  ('Pickup', Icons.directions_car, 'pickup'),
                                  ('Drop-off', Icons.store, 'dropoff'),
                                ],
                                selected: _pickupMode,
                                onSelect: (v) =>
                                    setState(() => _pickupMode = v),
                              ),
                              const SizedBox(height: 20),
                              _sectionLabel('Agent Matching'),
                              const SizedBox(height: 8),
                              _toggleRow(
                                items: [
                                  ('Auto', Icons.flash_on, 'auto'),
                                  (
                                    'Choose Agent',
                                    Icons.person_search,
                                    'user_selected'
                                  ),
                                ],
                                selected: _matchType,
                                onSelect: (v) {
                                  setState(() {
                                    _matchType = v;
                                    if (v == 'auto') _store.selectAgent(null);
                                  });
                                },
                              ),
                              if (_matchType == 'user_selected' &&
                                  _store.selectedAgent != null) ...[
                                const SizedBox(height: 12),
                                _selectedAgentChip(),
                              ],
                              const SizedBox(height: 20),
                              _sectionLabel('Waste Type'),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 80,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: _wasteOptions.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(width: 10),
                                  itemBuilder: (_, i) {
                                    final item = _wasteOptions[i];
                                    final active =
                                        _wasteType == item['value'];
                                    return _wasteTypeChip(item, active);
                                  },
                                ),
                              ),
                              const SizedBox(height: 24),
                              _sectionLabel('Estimated Weight (kg)'),
                              const SizedBox(height: 8),
                              _textField(
                                controller: _weightCtrl,
                                hint: 'e.g. 4.5',
                                keyboard:
                                    const TextInputType.numberWithOptions(
                                        decimal: true),
                                icon: Icons.scale,
                              ),
                              const SizedBox(height: 20),
                              _sectionLabel('Notes (optional)'),
                              const SizedBox(height: 8),
                              _textField(
                                controller: _notesCtrl,
                                hint: 'Gate code, landmarks, etc.',
                                keyboard: TextInputType.text,
                                icon: Icons.notes,
                                maxLines: 3,
                              ),
                              const SizedBox(height: 32),
                              SizedBox(
                                width: double.infinity,
                                height: 56,
                                child: ElevatedButton(
                                  onPressed: _store.isCreating
                                      ? null
                                      : () => _submit(),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppTheme.primaryGreen,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                  child: _store.isCreating
                                      ? const SizedBox.square(
                                          dimension: 24,
                                          child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2.5),
                                        )
                                      : const Text(
                                          'Request Pickup',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                ),
                              ),
                              SizedBox(height: 24.h),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              if (_locating)
                const Positioned(
                  top: 140,
                  left: 0,
                  right: 0,
                  child: Center(
                      child: CircularProgressIndicator(
                          color: AppTheme.primaryGreen)),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: AppTheme.surfaceDark,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.borderSoft),
        ),
        child: Icon(icon, color: AppTheme.primaryGreen, size: 22),
      ),
    );
  }

  Widget _locationChip(String text) {
    return Container(
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on, color: AppTheme.primaryGreen, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                  color: AppTheme.textSecondary, fontSize: 13.5),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down,
              color: AppTheme.textMuted, size: 20),
        ],
      ),
    );
  }

  Widget _myPickupsButton() {
    return GestureDetector(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MyPickupsPage())),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: AppTheme.primaryGreen.withOpacity(0.18),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.4)),
        ),
        child: const Text(
          'My Pickups',
          style: TextStyle(
            color: AppTheme.primaryGreen,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _sectionLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: AppTheme.textSecondary,
        fontSize: 13.5,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _toggleRow({
    required List<(String, IconData, String)> items,
    required String selected,
    required ValueChanged<String> onSelect,
  }) {
    return Row(
      children: items
          .map(
            (e) => Padding(
              padding: const EdgeInsets.only(right: 12),
              child: _toggleChip(
                label: e.$1,
                icon: e.$2,
                selected: selected == e.$3,
                onTap: () => onSelect(e.$3),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _toggleChip({
    required String label,
    required IconData icon,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: selected
              ? AppTheme.primaryGreen.withOpacity(0.18)
              : AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: selected ? AppTheme.primaryGreen : AppTheme.borderSoft),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon,
                size: 17,
                color: selected ? AppTheme.primaryGreen : AppTheme.textMuted),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color:
                    selected ? AppTheme.primaryGreen : AppTheme.textSecondary,
                fontSize: 13.5,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _wasteTypeChip(Map<String, dynamic> item, bool active) {
    return GestureDetector(
      onTap: () => setState(() => _wasteType = item['value']),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        width: 78,
        decoration: BoxDecoration(
          color: active
              ? AppTheme.primaryGreen.withOpacity(0.18)
              : AppTheme.darkBackground,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
              color: active ? AppTheme.primaryGreen : AppTheme.borderSoft),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              item['icon'] as IconData,
              color: active ? AppTheme.primaryGreen : AppTheme.textMuted,
              size: 22,
            ),
            const SizedBox(height: 6),
            Text(
              item['label'] as String,
              style: TextStyle(
                fontSize: 11,
                color: active ? AppTheme.primaryGreen : AppTheme.textMuted,
                fontWeight: active ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedAgentChip() {
    final agent = _store.selectedAgent!;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      decoration: BoxDecoration(
        color: AppTheme.primaryGreen.withOpacity(0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.35)),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle,
              color: AppTheme.primaryGreen, size: 18),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              '${agent.agentName} • ${agent.estimatedArrivalTime} min',
              style: const TextStyle(
                color: AppTheme.primaryGreen,
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => setState(() => _store.selectAgent(null)),
            child: const Icon(Icons.close, color: AppTheme.textMuted, size: 18),
          ),
        ],
      ),
    );
  }

  Widget _textField({
    required TextEditingController controller,
    required String hint,
    required TextInputType keyboard,
    required IconData icon,
    int maxLines = 1,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderSoft),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboard,
        maxLines: maxLines,
        minLines: 1,
        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 15),
          prefixIcon: Icon(icon, color: AppTheme.textMuted, size: 20),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        ),
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
