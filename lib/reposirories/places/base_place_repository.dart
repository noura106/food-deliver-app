import 'package:food_delivery_app/models/place_auto_complete.dart';
import 'package:food_delivery_app/models/place_model.dart';

abstract class BasePlacesRepository{
  Future<List<PlaceAutoCompleteModel>?> getAutoComplete(String searchInput)async{}
  Future<Place?> getPlace(String placeId) async{}

}