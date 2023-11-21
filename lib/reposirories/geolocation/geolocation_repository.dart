import 'package:food_delivery_app/models/place_model.dart';
import 'package:food_delivery_app/reposirories/geolocation/base__geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';

class GeolocationRepository extends BaseGeolocationRepo {
  GeolocationRepository();

  @override
  Future<Position?> getCurrentLocation() async {
    _checkGeolocatorPermistion();
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> _checkGeolocatorPermistion() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

}
