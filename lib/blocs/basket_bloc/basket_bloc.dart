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
      emit( BasketLoaded());
    });
    on<AddItem>((event, emit) async {
      try {
        emit(BasketLoaded(
            basket: (state as BasketLoaded).basket.copyWith(
                items:(state as BasketLoaded).basket.menuItems.toList()..add(event.menuItem)
                  )));
      } catch (e) {
        print(e);
      }
    });
    on<RemoveItem>((event, emit) async {
      try {
        if (state is BasketLoaded) {
          emit(BasketLoaded(
              basket: (state as BasketLoaded).basket.copyWith(
                  items: List.from((state as BasketLoaded).basket.menuItems.toList()
                    ..remove(event.menuItem)))));
          print((state as BasketLoaded).basket.menuItems);
        }
      } catch (_) {}
    });
    on<RemoveAllItem>((event, emit) async {
      try {
        if (state is BasketLoaded) {
          emit(BasketLoaded(
              basket: (state as BasketLoaded).basket.copyWith(
                  items: List.from((state as BasketLoaded).basket.menuItems.toList()
                    ..removeWhere((element) => element==event.menuItem)))));
          print((state as BasketLoaded).basket.menuItems);
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
