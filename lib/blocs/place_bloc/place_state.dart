part of 'place_bloc.dart';

@immutable
abstract class PlaceState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PlaceLoading extends PlaceState {}
class PlaceLoaded extends PlaceState {
  final Place place;
  PlaceLoaded({ required this.place});
  @override
  // TODO: implement props
  List<Object?> get props => [place];
}
class PlaceError extends PlaceState {}
