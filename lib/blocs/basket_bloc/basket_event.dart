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
class RemoveAllItem extends BasketEvent {
  final MenuItem menuItem;

  const RemoveAllItem({required this.menuItem});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItem];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();
}
class AddVoucher extends BasketEvent {
  final Voucher voucher;
  const AddVoucher(this.voucher);

  @override
  List<Object?> get props => [voucher];
}
class SelectDeliveryDay extends BasketEvent {
  const SelectDeliveryDay();

  @override
  List<Object?> get props => [];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;
  const SelectDeliveryTime(this.deliveryTime);

  @override
  List<Object?> get props => [deliveryTime];
}