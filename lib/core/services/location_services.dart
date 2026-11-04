import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationServices {
  static Future getCurrrentLocationData() async {
    bool serviceEnable = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnable) {
      throw Exception('Location service enabled disabled.');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are permanently denied.');
    }
    Position position = await Geolocator.getCurrentPosition(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        timeLimit: Duration(seconds: 15),
      ),
    );
    String cityName = 'unknown city';
    try {
      final Geocoding geocoding = Geocoding();
      List<Placemark> placeMarks = await geocoding.placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placeMarks.isNotEmpty) {
        final place = placeMarks.first;
        cityName = place.locality?.isNotEmpty == true
            ? place.locality!
            : (place.administrativeArea ?? 'Unknown City');
      }
    } catch (e) {
      cityName = 'unknown city';
    }
    return {
      'cityName': cityName,
      'latitude': position.latitude,
      'longitude': position.longitude,
    };
  }
}
