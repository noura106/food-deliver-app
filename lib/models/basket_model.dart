import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/models.dart';

class Basket extends Equatable {
  final List<MenuItem> menuItems;
  final bool cutlery;

  const Basket({this.menuItems = const <MenuItem>[], this.cutlery = false});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItems, cutlery];

  Basket copyWith({ List<MenuItem>? items,  bool? cutlery}) {
    return Basket(
        cutlery: cutlery ?? this.cutlery, menuItems: items ?? menuItems);
  }

  /// calculating the quantity of each item in basket
  Map itemQuantity(List<MenuItem> items) {
    var quantity = {};
    for (var item in items) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item]++;
      }
    }
    return quantity;
  }

  double get subtotal =>
      menuItems.fold(0, (total, current) => total + current.price);

  ///+ deliveryFee for example it's 5
  double get total => subtotal + 5;

  String get subtotalToString => subtotal.toStringAsFixed(2);

  String get totalToString => total.toStringAsFixed(2);
}
