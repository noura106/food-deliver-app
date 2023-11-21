import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterLoading()) {
    on<FilterLoad>((event, emit) {
      emit(FilterLoaded(
          filter: Filter(
              categoryFilterModel: CategoryFilterModel.categoryFilters,
              priceFilter: PriceFilter.filters)));
    });
    on<CategoryFilterLoaded>((event, emit) async {
      if (state is FilterLoaded) {
        final List<CategoryFilterModel> updatedCategoryFilters =
        ( state as FilterLoaded).filter.categoryFilterModel
                .map((categoryFilter) =>
                    categoryFilter.id == event.categoryFilterModel.id
                        ? event.categoryFilterModel
                        : categoryFilter)
                .toList();
        emit(FilterLoaded(
            filter: Filter(
                categoryFilterModel: updatedCategoryFilters,
                priceFilter:   ( state as FilterLoaded).filter.priceFilter)));
      }
    });
    on<PriceFilterLoaded>((event, emit) async {
      if (state is FilterLoaded) {
        final List<PriceFilter> updatedPriceFilter =
        ( state as FilterLoaded).filter.priceFilter
            .map((priceFilter) =>
        priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter)
            .toList();
        emit(FilterLoaded(
            filter: Filter(
                categoryFilterModel:  ( state as FilterLoaded).filter.categoryFilterModel,
                priceFilter:updatedPriceFilter)));
      }
    });
  }
}
