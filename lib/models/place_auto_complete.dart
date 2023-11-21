import 'package:equatable/equatable.dart';

class PlaceAutoCompleteModel extends Equatable {
  final String description;
  final String placeId;

  const PlaceAutoCompleteModel(
      {required this.description, required this.placeId});

  @override
  // TODO: implement props
  List<Object?> get props => [description, placeId];

  factory PlaceAutoCompleteModel.fromJson(Map<String, dynamic> json) {
    return PlaceAutoCompleteModel(
        description: json['description'], placeId: json['placeId']);
  }
}
