part of 'filter_bloc.dart';

@immutable
abstract class FilterState extends Equatable {
  const FilterState();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FilterLoading extends FilterState {}

class FilterLoaded extends FilterState {
  final Filter filter;

  const FilterLoaded({this.filter = const Filter()});
  @override
  // TODO: implement props
  List<Object?> get props => [filter];
}
