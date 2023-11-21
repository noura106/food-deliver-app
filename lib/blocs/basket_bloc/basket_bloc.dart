import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../models/models.dart';

part 'basket_event.dart';

part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketLoading()) {
    on<StartBasket>((event, emit) async {
      emit(BasketLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(const BasketLoaded());
    });
    on<AddItem>((event, emit) async {
      try {
        if (state is BasketLoaded) {
          emit(BasketLoaded(
              basket: (state as BasketLoaded).basket.copyWith(
                  items: List.from((state as BasketLoaded).basket.menuItems
                    ..add(event.menuItem)))));
        }
      } catch (_) {}
    });
    on<RemoveItem>((event, emit) async {
      try {
        if (state is BasketLoaded) {
          emit(BasketLoaded(
              basket: (state as BasketLoaded).basket.copyWith(
                  items: List.from((state as BasketLoaded).basket.menuItems
                    ..remove(event.menuItem)))));
        }
      } catch (_) {}
    });
    on<ToggleSwitch>((event, emit) async {
      try {
        if (state is BasketLoaded) {
          emit(BasketLoaded(
              basket: (state as BasketLoaded)
                  .basket
                  .copyWith(cutlery: !(state as BasketLoaded).basket.cutlery)));
        }
      } catch (_) {}
    });
  }
}
