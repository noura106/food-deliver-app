import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/widgets/home/resturant_card.dart';

class RestaurantListingScreen extends StatelessWidget {
  final List<Restaurant> restaurants;

  const RestaurantListingScreen({super.key, required this.restaurants});

  static const String routeName = '/restaurant_listing';

  static Route route({required List<Restaurant> restaurants}) {
    return MaterialPageRoute(
        builder: (_) => RestaurantListingScreen(
              restaurants: restaurants,
            ),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Restaurants')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurants.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
          return RestaurantCard(restaurant: restaurants[index]);
        }),
      ),
    );
  }
}
