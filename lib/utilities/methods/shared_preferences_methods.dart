import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPreferencesMethods {
  static Future<void> saveUserToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_token', token);
  }

  static Future<void> saveUserData(
      int id, String username, String email) async {
    final prefs = await SharedPreferences.getInstance();
    var user = {
      'id': id,
      'username': username,
      'email': email,
    };
    await prefs.setString('user', user.toString());
  }

  static Future<String?> getUserToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_token');
  }

  static Future<Map<String, dynamic>?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userString = prefs.getString('user');
    if (userString == null) {
      return null;
    }

    try {
      final userMap = Map<String, dynamic>.from(jsonDecode(userString));
      return userMap;
    } catch (e) {
      print('Error al decodificar datos del usuario: $e');
      return null;
    }
  }

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
