part of 'gelocation_bloc.dart';

@immutable
abstract class GeLocationState extends Equatable {
  const GeLocationState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GeLocationLoading extends GeLocationState {}

class GeLocationLoaded extends GeLocationState {
  final Position position;

  GeLocationLoaded({required this.position});

  @override
  // TODO: implement props
  List<Object?> get props => [position];
}

class GeLocationError extends GeLocationState {}
