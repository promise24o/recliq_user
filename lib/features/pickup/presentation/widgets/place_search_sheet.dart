import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../shared/themes/app_theme.dart';

const String kGoogleApiKey = 'AIzaSyA2keF1ucUSIKPC098o0T84LtKyI64Okh8';

class PlaceSearchSheet extends StatefulWidget {
  final LatLng initialLocation;
  const PlaceSearchSheet({super.key, required this.initialLocation});

  @override
  State<PlaceSearchSheet> createState() => _PlaceSearchSheetState();
}

class _PlaceSearchSheetState extends State<PlaceSearchSheet> {
  final _searchCtrl = TextEditingController();
  final _focusNode = FocusNode();
  final _dio = Dio();

  List<Map<String, dynamic>> _suggestions = [];
  bool _loading = false;
  String? _sessionToken;

  @override
  void initState() {
    super.initState();
    _sessionToken = DateTime.now().millisecondsSinceEpoch.toString();
    WidgetsBinding.instance
        .addPostFrameCallback((_) => _focusNode.requestFocus());
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    _focusNode.dispose();
    _dio.close();
    super.dispose();
  }

  Future<void> _searchPlaces(String input) async {
    if (input.trim().length < 2) {
      setState(() => _suggestions = []);
      return;
    }

    setState(() => _loading = true);

    try {
      final resp = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: {
          'input': input,
          'key': kGoogleApiKey,
          'sessiontoken': _sessionToken,
          'location':
              '${widget.initialLocation.latitude},${widget.initialLocation.longitude}',
          'radius': 60000,
          'language': 'en',
        },
      );

      final data = resp.data as Map<String, dynamic>;
      if (data['status'] == 'OK') {
        final preds = data['predictions'] as List;
        setState(() {
          _suggestions = preds.map((p) {
            final fmt = p['structured_formatting'] as Map?;
            return {
              'placeId': p['place_id'] as String? ?? '',
              'mainText': fmt?['main_text'] as String? ??
                  p['description'] as String? ??
                  '',
              'secondaryText': fmt?['secondary_text'] as String? ?? '',
            };
          }).toList();
        });
      } else {
        setState(() => _suggestions = []);
      }
    } catch (_) {
      setState(() => _suggestions = []);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _selectSuggestion(Map<String, dynamic> place) async {
    setState(() => _loading = true);

    try {
      final resp = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: {
          'place_id': place['placeId'],
          'fields': 'geometry,formatted_address',
          'key': kGoogleApiKey,
          'sessiontoken': _sessionToken,
        },
      );

      final data = resp.data as Map<String, dynamic>;
      if (data['status'] == 'OK') {
        final loc = data['result']['geometry']['location'];
        final lat = (loc['lat'] as num).toDouble();
        final lng = (loc['lng'] as num).toDouble();
        final addr = data['result']['formatted_address'] as String? ??
            'Selected location';

        if (mounted) {
          Navigator.pop(context, {'latLng': LatLng(lat, lng), 'address': addr});
        }
      }
    } catch (_) {
      // silent fail
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _useCurrentLocation() async {
    setState(() => _loading = true);

    try {
      if (!await Geolocator.isLocationServiceEnabled()) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location services are disabled'),
              backgroundColor: AppTheme.danger,
            ),
          );
        }
        return;
      }

      var perm = await Geolocator.checkPermission();
      if (perm == LocationPermission.denied) {
        perm = await Geolocator.requestPermission();
        if (perm == LocationPermission.denied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Location permission denied'),
                backgroundColor: AppTheme.danger,
              ),
            );
          }
          return;
        }
      }

      final pos = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (mounted) {
        Navigator.pop(context, {
          'latLng': LatLng(pos.latitude, pos.longitude),
          'address': 'My current location',
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to get location: ${e.toString()}'),
            backgroundColor: AppTheme.danger,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      height: MediaQuery.of(context).size.height * 0.88,
      decoration: const BoxDecoration(
        color: AppTheme.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 14),
          Container(
              width: 44,
              height: 5,
              decoration: BoxDecoration(
                  color: AppTheme.borderSoft,
                  borderRadius: BorderRadius.circular(4))),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppTheme.darkBackground,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.borderSoft),
                    ),
                    child: const Icon(Icons.arrow_back,
                        color: AppTheme.textPrimary, size: 20),
                  ),
                ),
                const SizedBox(width: 16),
                const Text('Choose Pickup Location',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _searchField(),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _currentLocationTile(),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Expanded(child: Divider(color: AppTheme.borderSoft)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text('SUGGESTIONS',
                      style:
                          TextStyle(color: AppTheme.textMuted, fontSize: 11.5)),
                ),
                const Expanded(child: Divider(color: AppTheme.borderSoft)),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: _loading
                ? const Center(
                    child: CircularProgressIndicator(
                        color: AppTheme.primaryGreen, strokeWidth: 2.5))
                : _suggestions.isEmpty
                    ? _emptyState()
                    : ListView.separated(
                        padding: EdgeInsets.fromLTRB(20, 4, 20, bottom + 24),
                        itemCount: _suggestions.length,
                        separatorBuilder: (_, __) => const Divider(
                            height: 1, color: AppTheme.borderSoft),
                        itemBuilder: (_, i) => _suggestionTile(_suggestions[i]),
                      ),
          ),
        ],
      ),
    );
  }

  Widget _searchField() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.darkBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.4)),
      ),
      child: TextField(
        controller: _searchCtrl,
        focusNode: _focusNode,
        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 15.5),
        decoration: InputDecoration(
          hintText: 'Search address, area, landmark…',
          hintStyle: const TextStyle(color: AppTheme.textMuted, fontSize: 15.5),
          prefixIcon:
              const Icon(Icons.search, color: AppTheme.primaryGreen, size: 22),
          suffixIcon: _searchCtrl.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.close,
                      color: AppTheme.textMuted, size: 20),
                  onPressed: () {
                    _searchCtrl.clear();
                    setState(() => _suggestions = []);
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onChanged: _searchPlaces,
      ),
    );
  }

  Widget _currentLocationTile() {
    return GestureDetector(
      onTap: _useCurrentLocation,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: AppTheme.primaryGreen.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppTheme.primaryGreen.withOpacity(0.3)),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: AppTheme.primaryGreen.withOpacity(0.18),
                  shape: BoxShape.circle),
              child: _loading
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: AppTheme.primaryGreen,
                        strokeWidth: 2,
                      ),
                    )
                  : const Icon(Icons.my_location,
                      color: AppTheme.primaryGreen, size: 20),
            ),
            const SizedBox(width: 14),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Use my current location',
                      style: TextStyle(
                          color: AppTheme.primaryGreen,
                          fontSize: 15,
                          fontWeight: FontWeight.w600)),
                  SizedBox(height: 2),
                  Text('GPS • accurate',
                      style:
                          TextStyle(color: AppTheme.textMuted, fontSize: 12.5)),
                ],
              ),
            ),
            if (!_loading)
              const Icon(Icons.chevron_right,
                  color: AppTheme.primaryGreen, size: 22),
          ],
        ),
      ),
    );
  }

  Widget _suggestionTile(Map<String, dynamic> place) {
    return GestureDetector(
      onTap: () => _selectSuggestion(place),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: AppTheme.darkBackground,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.borderSoft),
              ),
              alignment: Alignment.center,
              child: const Icon(Icons.location_on_outlined,
                  color: AppTheme.textMuted, size: 20),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place['mainText'] ?? '',
                    style: const TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (place['secondaryText']?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Text(
                        place['secondaryText'],
                        style: const TextStyle(
                            color: AppTheme.textMuted, fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            const Icon(Icons.north_west, size: 16, color: AppTheme.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _emptyState() {
    if (_searchCtrl.text.trim().isEmpty) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.search_rounded,
                size: 64, color: AppTheme.textMuted.withOpacity(0.35)),
            const SizedBox(height: 16),
            const Text('Search for an address or place',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 15)),
          ],
        ),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_off,
              size: 64, color: AppTheme.textMuted.withOpacity(0.35)),
          const SizedBox(height: 16),
          const Text('No results found',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 15.5)),
          const SizedBox(height: 6),
          const Text('Try a different keyword',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 13)),
        ],
      ),
    );
  }
}
