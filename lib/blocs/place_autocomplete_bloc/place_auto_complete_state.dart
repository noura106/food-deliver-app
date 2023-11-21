part of 'place_auto_complete_bloc.dart';

@immutable
abstract class PlaceAutoCompleteState extends Equatable {
  const PlaceAutoCompleteState();

  @override
// TODO: implement props
  List<Object?> get props => [];
}

class PlaceAutoCompleteLoading extends PlaceAutoCompleteState {}

class PlaceAutoCompleteLoaded extends PlaceAutoCompleteState {
  final List<PlaceAutoCompleteModel> autoComplete;

  const PlaceAutoCompleteLoaded({required this.autoComplete});

  @override
// TODO: implement props
  List<Object?> get props => [autoComplete];
}

class PlaceAutoCompleteError extends PlaceAutoCompleteState {}
