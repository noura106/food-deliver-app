import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/delivery_time_model.dart';
import 'package:food_delivery_app/models/models.dart';

class Basket extends Equatable {
   final List<MenuItem> menuItems;
  final bool cutlery;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

   const Basket({this.menuItems =  const <MenuItem>[], this.cutlery = false,this.voucher,this.deliveryTime});

  @override
  // TODO: implement props
  List<Object?> get props => [menuItems, cutlery,voucher];

  Basket copyWith({ List<MenuItem>? items,  bool? cutlery,Voucher? voucher,DeliveryTime ? deliveryTime}) {
    return Basket(
        cutlery: cutlery ?? this.cutlery, menuItems: items ?? menuItems,voucher: voucher,deliveryTime: deliveryTime?? this.deliveryTime);
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
  double get total =>   (voucher == null) ? subtotal + 5 : subtotal + 5 - voucher!.value;

  String get subtotalToString => subtotal.toStringAsFixed(2);

  String get totalToString => total.toStringAsFixed(2);
}
