part of 'place_bloc.dart';

@immutable
abstract class PlaceEvent extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class LoadPlace extends PlaceEvent{
  final String placeId;
  LoadPlace({required this.placeId});
  @override
  // TODO: implement props
  List<Object?> get props => [placeId];
}
