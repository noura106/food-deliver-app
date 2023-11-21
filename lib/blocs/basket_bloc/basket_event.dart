part of 'basket_bloc.dart';

@immutable
abstract class BasketEvent extends Equatable {
  const BasketEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class StartBasket extends BasketEvent {}

class AddItem extends BasketEvent {
  final MenuItem menuItem;

  const AddItem({required this.menuItem});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItem];
}

class RemoveItem extends BasketEvent {
  final MenuItem menuItem;

  const RemoveItem({required this.menuItem});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItem];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();
}
