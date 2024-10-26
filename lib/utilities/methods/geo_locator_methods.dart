import 'package:geolocator/geolocator.dart';
import 'package:maceta_inteligente/utilities/methods/shared_preferences_methods.dart';

abstract class GeoLocatorMethod {
  static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  static void getLocation() async {
    try {
      Position posicion = await GeoLocatorMethod.determinePosition();

      double latitud = posicion.latitude;
      double longitud = posicion.longitude;

      print('Latitud: $latitud, Longitud: $longitud');

      SharedPreferencesMethods.saveUserLocation(latitud, longitud);
    } catch (e) {
      print('Error al obtener la ubicación: $e');
    }
  }
}