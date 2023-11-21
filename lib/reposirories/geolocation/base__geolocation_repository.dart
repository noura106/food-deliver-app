import 'package:food_delivery_app/models/place_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class BaseGeolocationRepo {
  Future<Position?> getCurrentLocation()async{}
}