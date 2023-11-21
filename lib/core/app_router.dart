import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/home_screen.dart';
import 'package:food_delivery_app/screens/location_screen.dart';
import 'package:food_delivery_app/screens/screens.dart';

class AppRouter {
  static Route onGenerateRouting(RouteSettings settings) {
    switch (settings.name) {
      case HomeScreen.routeName:
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(restaurant: settings.arguments as Restaurant);
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route(restaurants: settings.arguments as List<Restaurant>);
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              body: Center(
                child: Text('Error Route'),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
