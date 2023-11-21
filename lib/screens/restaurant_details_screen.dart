import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/screens/basket_screen.dart';
import 'package:food_delivery_app/widgets/restaurants/restaurants_information.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantDetailsScreen({super.key,required this.restaurant});

  static const String routeName = '/restaurant_details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
        builder: (_) =>  RestaurantDetailsScreen(restaurant: restaurant,),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                child: Text(
                  'Basket',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white),
                ),
                onPressed: () => Navigator.pushNamed(context, BasketScreen.routeName),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 50)),
                    image: DecorationImage(
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.cover)),
              ),
              RestaurantInformation(restaurant: restaurant),


            ],
          ),
        ));
  }
}
