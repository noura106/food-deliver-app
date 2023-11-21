import 'package:equatable/equatable.dart';

class Place extends Equatable {
  final String placeId;
  final String name;
  final double lat;
  final double lan;

  Place(
      {this.placeId = '',
      this.name = '',
      required this.lat,
      required this.lan});

  @override
  // TODO: implement props
  List<Object?> get props => [placeId, name, lat, lan];

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      placeId: json['place_id'],
        lat: json['geometry']['location']['lat'],
        lan: json['geometry']['location']['lng'],
        name: json['formatted_address']);
  }
}
