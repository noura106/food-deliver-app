import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/restaurant_details_screen.dart';
import 'package:food_delivery_app/widgets/home/restaurant_tags.dart';

import '../../models/models.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, RestaurantDetailsScreen.routeName,arguments: restaurant),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: NetworkImage(restaurant.imageUrl),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 60,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${restaurant.deliveryTime} min',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurant.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
            RestaurantTags(restaurant: restaurant),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  '${restaurant.distance} km - \$ ${restaurant.deliveryFee}',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
