import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class RecentSearchLocation {
  final String address;
  final double lat;
  final double lng;
  final DateTime timestamp;

  RecentSearchLocation({
    required this.address,
    required this.lat,
    required this.lng,
  }) : timestamp = DateTime.now();

  Map<String, dynamic> toJson() => {
        'address': address,
        'lat': lat,
        'lng': lng,
        'timestamp': timestamp.toIso8601String(),
      };

  factory RecentSearchLocation.fromJson(Map<String, dynamic> json) => RecentSearchLocation(
        address: json['address'] as String,
        lat: (json['lat'] as num).toDouble(),
        lng: (json['lng'] as num).toDouble(),
      );
}

abstract class RecentSearchLocalDataSource {
  Future<List<RecentSearchLocation>> getRecentSearches();
  Future<void> addRecentSearch(RecentSearchLocation location);
  Future<void> clearRecentSearches();
}

class RecentSearchLocalDataSourceImpl implements RecentSearchLocalDataSource {
  final SharedPreferences _prefs;
  static const String _recentSearchesKey = 'recent_search_locations';
  static const int _maxCachedLocations = 10;

  RecentSearchLocalDataSourceImpl({required SharedPreferences prefs})
      : _prefs = prefs;

  @override
  Future<List<RecentSearchLocation>> getRecentSearches() async {
    final cached = _prefs.getString(_recentSearchesKey);
    if (cached == null) return [];

    try {
      final List<dynamic> jsonList = json.decode(cached);
      return jsonList
          .map((json) => RecentSearchLocation.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      // If there's an error parsing, clear the cache
      await _prefs.remove(_recentSearchesKey);
      return [];
    }
  }

  @override
  Future<void> addRecentSearch(RecentSearchLocation location) async {
    final current = await getRecentSearches();
    
    // Remove if already exists
    current.removeWhere((loc) => loc.lat == location.lat && loc.lng == location.lng);
    
    // Add to front
    current.insert(0, location);

    // Keep only recent items
    if (current.length > _maxCachedLocations) {
      current.removeRange(_maxCachedLocations, current.length);
    }

    final jsonList = current.map((loc) => loc.toJson()).toList();
    await _prefs.setString(_recentSearchesKey, json.encode(jsonList));
  }

  @override
  Future<void> clearRecentSearches() async {
    await _prefs.remove(_recentSearchesKey);
  }
}
