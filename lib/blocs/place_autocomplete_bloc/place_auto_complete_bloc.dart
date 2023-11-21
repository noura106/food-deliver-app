import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/place_auto_complete.dart';
import 'package:food_delivery_app/reposirories/places/place_repository.dart';
import 'package:meta/meta.dart';

part 'place_auto_complete_event.dart';

part 'place_auto_complete_state.dart';

class PlaceAutoCompleteBloc
    extends Bloc<PlaceAutoCompleteEvent, PlaceAutoCompleteState> {
  final PlaceAutoCompleteRepo _placeAutoCompleteRepo;

  PlaceAutoCompleteBloc({required PlaceAutoCompleteRepo placeAutoCompleteRepo})
      : _placeAutoCompleteRepo = placeAutoCompleteRepo,
        super(PlaceAutoCompleteLoading()) {
    on<LoadPlaceAutoCompleteEvent>((event, emit) async{
     emit(PlaceAutoCompleteLoading());
     final List<PlaceAutoCompleteModel>? autoComplete= await _placeAutoCompleteRepo.getAutoComplete(event.searchInput);
     emit(PlaceAutoCompleteLoaded(autoComplete: autoComplete!));
    });
  }
}
