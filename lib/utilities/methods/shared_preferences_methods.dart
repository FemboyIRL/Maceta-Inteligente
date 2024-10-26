import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesMethods{
  static Future<void> saveUserLocation(double lat, double lng) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('lat', lat);
    await prefs.setDouble('lng', lng);
  }

  static Future<Position?> getUserLocation() async {
    final prefs = await SharedPreferences.getInstance();
    final lat = prefs.getDouble('lat');
    final lng = prefs.getDouble('lng');

    if (lat == null) {
      print('lat es null');
      return null;
    }
    if (lng == null) {
      print('lng es null');
      return null;
    }
    return Position(
    latitude: lat,
    longitude: lng,
    timestamp: DateTime.now(),
    accuracy: 0.0,             
    altitude: 0.0,
    altitudeAccuracy: 0.0,
    headingAccuracy: 0.0,
    heading: 0.0,
    speed: 0.0,
    speedAccuracy: 0.0,
  );
  }
}