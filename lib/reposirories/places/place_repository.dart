import 'package:food_delivery_app/models/place_auto_complete.dart';
import 'package:food_delivery_app/models/place_model.dart';
import 'package:food_delivery_app/reposirories/places/base_place_repository.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class PlaceAutoCompleteRepo extends BasePlacesRepository {
  PlaceAutoCompleteRepo();

  final String key = 'must get a string key from google map platform';
  final String type = 'geocode';

  @override
  Future<List<PlaceAutoCompleteModel>?> getAutoComplete(
      String searchInput) async {
    final String url = '';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results= json['predictions'] as List;
    return results.map((place) => PlaceAutoCompleteModel.fromJson(place)).toList();
  }
  @override
  Future<Place?> getPlace(String placeId)async{
    final String url='must have the api from google map';
    var response =await http.get(Uri.parse(url));
    var json= convert.jsonDecode(response.body);
    var result= json['results'] as Map<String,dynamic>;
    return Place.fromJson(result);
  }
}
