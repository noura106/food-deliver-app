import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/models.dart';

class Filter extends Equatable {
  final List<CategoryFilterModel> categoryFilterModel;
  final List<PriceFilter> priceFilter;

  const Filter(
      {this.categoryFilterModel = const <CategoryFilterModel>[],
      this.priceFilter = const <PriceFilter>[]});

  Filter copyWith(
      {required List<CategoryFilterModel>? categoryFilters,
      required List<PriceFilter>? priceFilter}) {
    return Filter(
        categoryFilterModel: categoryFilters ?? categoryFilterModel,
        priceFilter: priceFilter ?? this.priceFilter);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [categoryFilterModel, priceFilter];
}
