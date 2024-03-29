import 'dart:io';

import 'package:dio/dio.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../../data/models/address_model/place_result_model.dart';

class GoogleMapsServices {
  GoogleMapsServices();

  Future<List<Placemark>> getUserAddress({
    required double lat,
    required double lng,
  }) async {
    List<Placemark> placeMarks = await placemarkFromCoordinates(lat, lng);
    return placeMarks;
  }

  Future<Position> getCurrentPosition() async {
    await _checkLocationServices();
    await _checkLocationPermissions();
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  Future<void> _checkLocationServices() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw 'Location services are disabled.';
    }
  }

  Future<void> _checkLocationPermissions() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied.';
      }
    } else if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied.';
    }
  }

  final LocationSettings locationSettings = Platform.isAndroid
      ? AndroidSettings(
          accuracy: LocationAccuracy.high,
          forceLocationManager: true,
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText: "running location",
            notificationIcon:
                AndroidResource(name: 'launcher_icon', defType: 'mipmap'),
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ),
        )
      : Platform.isIOS
          ? AppleSettings(
              accuracy: LocationAccuracy.high,
              activityType: ActivityType.fitness,
              pauseLocationUpdatesAutomatically: true,
              showBackgroundLocationIndicator: false,
            )
          : const LocationSettings(
              accuracy: LocationAccuracy.high,
            );

  Future<Stream<Position>> streamLocation(
      LocationSettings? locationSettings) async {
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }

  final _dio = Dio();

  Future<List<PlaceResult>> searchPlaces(String query) async {
    const apiKey = 'AIzaSyC2A8x1veFcxA54gX82njTzWZ_aAarTU1E';
    final url =
        'https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$apiKey';

    final response = await _dio.get(
      url,
    );
    List<PlaceResult> searchResults = [];
    if (response.statusCode == 200) {
      final predictions = response.data['results'] as List<dynamic>;
      searchResults =
          predictions.map((result) => PlaceResult.fromJson(result)).toList();
    } else {
      searchResults = [];
    }
    return searchResults;
  }
  Future<LocationDescription> getLocationDescription(double latitude, double longitude) async {
    const apiKey = 'AIzaSyC2A8x1veFcxA54gX82njTzWZ_aAarTU1E';
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&language=ar&key=$apiKey';

    final response = await _dio.get(
      url,
    );
    if (response.statusCode == 200) {
      return LocationDescription.fromJson(response.data);
    } else {
      throw Exception('Failed to load location description');
    }
  }
}
class LocationDescription {
  final String? formattedAddress;

  LocationDescription({this.formattedAddress});

  factory LocationDescription.fromJson(Map<String, dynamic> json) {
    print(json);
    return LocationDescription(
      formattedAddress: json['results'][0]['formatted_address'],
    );
  }
}