part of 'gelocation_bloc.dart';

@immutable
abstract class GeLocationEvent extends Equatable {
  const GeLocationEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class LoadGeoLocation extends GeLocationEvent {}

class UpdateGeoLocation extends GeLocationEvent {
  final Position position;

  const UpdateGeoLocation({required this.position});

  @override
  // TODO: implement props
  List<Object?> get props => [position];
}
