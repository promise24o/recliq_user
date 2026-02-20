import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../../shared/themes/app_theme.dart';

class LocationAutocomplete extends StatefulWidget {
  final String? initialValue;
  final Function(LocationData) onLocationSelected;
  final String? hintText;
  final EdgeInsets? margin;

  const LocationAutocomplete({
    super.key,
    this.initialValue,
    required this.onLocationSelected,
    this.hintText,
    this.margin,
  });

  @override
  State<LocationAutocomplete> createState() => _LocationAutocompleteState();
}

class _LocationAutocompleteState extends State<LocationAutocomplete> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<Map<String, dynamic>> _suggestions = [];
  bool _isLoading = false;
  bool _showSuggestions = false;

  static const String _apiKey = 'AIzaSyA2keF1ucUSIKPC098o0T84LtKyI64Okh8';
  final Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.initialValue ?? '';
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus && _controller.text.isNotEmpty) {
      _searchPlaces(_controller.text);
    } else {
      setState(() {
        _showSuggestions = false;
      });
    }
  }

  Future<void> _searchPlaces(String query) async {
    if (query.trim().isEmpty) {
      setState(() {
        _suggestions = [];
        _showSuggestions = false;
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _showSuggestions = true;
    });

    try {
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json',
        queryParameters: {
          'input': query,
          'components': 'country:NG', // Restrict to Nigeria
          'key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          _suggestions = List<Map<String, dynamic>>.from(data['predictions'] ?? []);
          _isLoading = false;
        });
      } else {
        setState(() {
          _suggestions = [];
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _suggestions = [];
        _isLoading = false;
      });
    }
  }

  Future<void> _selectPlace(Map<String, dynamic> place) async {
    try {
      // Get place details
      final response = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/details/json',
        queryParameters: {
          'place_id': place['place_id'],
          'fields': 'formatted_address,geometry,address_components',
          'key': _apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final result = data['result'];
        
        // Get coordinates from place details
        final lat = result['geometry']['location']['lat'];
        final lng = result['geometry']['location']['lng'];

        if (lat != null && lng != null) {
          // Get address components using geocoding
          final placemarks = await placemarkFromCoordinates(lat, lng);
          final placemark = placemarks.first;

          final locationData = LocationData(
            address: result['formatted_address'] ?? placemark.street ?? '',
            city: placemark.locality ?? '',
            state: placemark.administrativeArea ?? '',
            country: placemark.country ?? '',
            latitude: lat,
            longitude: lng,
            placeId: place['place_id'],
          );

          _controller.text = locationData.fullAddress;
          widget.onLocationSelected(locationData);
          setState(() {
            _showSuggestions = false;
          });
        }
      }
    } catch (e) {
      // Handle error
    }
  }

  Future<void> _getCurrentLocation() async {
    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      // Get current location
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Get address from coordinates
      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      final placemark = placemarks.first;

      final locationData = LocationData(
        address: placemark.street ?? '',
        city: placemark.locality ?? '',
        state: placemark.administrativeArea ?? '',
        country: placemark.country ?? '',
        latitude: position.latitude,
        longitude: position.longitude,
      );

      _controller.text = locationData.fullAddress;
      widget.onLocationSelected(locationData);
      setState(() {
        _showSuggestions = false;
      });
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Input field
          Container(
            decoration: BoxDecoration(
              color: AppTheme.surfaceDark,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: AppTheme.borderSoft,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                // Location icon
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Icon(
                    Icons.location_on_outlined,
                    color: AppTheme.textMuted,
                    size: 20.w,
                  ),
                ),
                // Text field
                Expanded(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    onChanged: _searchPlaces,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.sp,
                    ),
                    decoration: InputDecoration(
                      hintText: widget.hintText ?? 'Enter your address',
                      hintStyle: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 16.h,
                        horizontal: 0,
                      ),
                    ),
                  ),
                ),
                // Current location button
                Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: GestureDetector(
                    onTap: _getCurrentLocation,
                    child: Icon(
                      Icons.my_location,
                      color: AppTheme.primaryGreen,
                      size: 20.w,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Suggestions dropdown
          if (_showSuggestions)
            Container(
              margin: EdgeInsets.only(top: 8.h),
              decoration: BoxDecoration(
                color: AppTheme.surfaceDark,
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(
                  color: AppTheme.borderSoft,
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: _isLoading
                  ? Container(
                      padding: EdgeInsets.all(16.h),
                      child: Center(
                        child: SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppTheme.primaryGreen,
                            ),
                          ),
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _suggestions.length,
                      separatorBuilder: (context, index) => Divider(
                        color: AppTheme.borderSoft,
                        height: 1,
                      ),
                      itemBuilder: (context, index) {
                        final place = _suggestions[index];
                        return ListTile(
                          dense: true,
                          leading: Icon(
                            Icons.location_on_outlined,
                            color: AppTheme.textMuted,
                            size: 18.w,
                          ),
                          title: Text(
                            place['description'] ?? '',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () => _selectPlace(place),
                        );
                      },
                    ),
            ),
        ],
      ),
    );
  }
}

class LocationData {
  final String address;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final String? placeId;

  LocationData({
    required this.address,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    this.placeId,
  });

  String get fullAddress {
    final parts = <String>[];
    if (address.isNotEmpty) parts.add(address);
    if (city.isNotEmpty) parts.add(city);
    if (state.isNotEmpty) parts.add(state);
    if (country.isNotEmpty) parts.add(country);
    return parts.join(', ');
  }

  Map<String, dynamic> toApiJson() {
    return {
      'coordinates': [longitude, latitude],
      'address': fullAddress,
      'city': city,
      'state': state,
      'country': country,
    };
  }
}
