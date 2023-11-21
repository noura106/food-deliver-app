part of 'filter_bloc.dart';

@immutable
abstract class FilterEvent extends Equatable {
  const FilterEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class FilterLoad extends FilterEvent{}

class CategoryFilterLoaded extends FilterEvent{
  final CategoryFilterModel categoryFilterModel;
  const CategoryFilterLoaded({required this.categoryFilterModel});
  @override
  // TODO: implement props
  List<Object?> get props => [categoryFilterModel];
}

class PriceFilterLoaded extends FilterEvent{
  final PriceFilter priceFilter;
  const PriceFilterLoaded({required this.priceFilter});
  @override
  // TODO: implement props
  List<Object?> get props => [priceFilter];
}