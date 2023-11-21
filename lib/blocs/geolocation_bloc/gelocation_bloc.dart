import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/reposirories/geolocation/geolocation_repository.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'gelocation_event.dart';

part 'gelocation_state.dart';

class GeLocationBloc extends Bloc<GeLocationEvent, GeLocationState> {
  final GeolocationRepository _geolocationRepo;
  StreamSubscription? _geoLocationSubscription;

  GeLocationBloc({required GeolocationRepository geolocationRepository})
      : _geolocationRepo = geolocationRepository,
        super(GeLocationLoading()) {
    on<LoadGeoLocation>((event, emit) async {
      emit(GeLocationLoading());
      _geoLocationSubscription?.cancel();
      final Position? position = await _geolocationRepo.getCurrentLocation();
      add(UpdateGeoLocation(position: position!));
    });
    on<UpdateGeoLocation>((event, emit) async {
      emit(GeLocationLoaded(position: event.position));
    });
  }
}
