import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/place_model.dart';
import 'package:food_delivery_app/reposirories/places/place_repository.dart';
import 'package:meta/meta.dart';

part 'place_event.dart';

part 'place_state.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceAutoCompleteRepo _placeAutoCompleteRepo;

  PlaceBloc({required PlaceAutoCompleteRepo placeAutoCompleteRepo})
      : _placeAutoCompleteRepo = placeAutoCompleteRepo,
        super(PlaceLoading()) {
    on<LoadPlace>((event, emit) async {
      emit(PlaceLoading());
      final Place? place = await _placeAutoCompleteRepo.getPlace(event.placeId);
      emit(PlaceLoaded(place: place!));
    });
  }
}
