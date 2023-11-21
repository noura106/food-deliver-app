import 'package:flutter/material.dart';

import '../../models/models.dart';
import '../../screens/screens.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Restaurant> restaurants =Restaurant.restaurants.where((element) => element.tags.contains(category.name)).toList();
    return InkWell(
      onTap: ()=>Navigator.pushNamed(context, RestaurantListingScreen.routeName,arguments: restaurants),
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    category.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(color: Colors.white),
                  )),
            ),
            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  width: 60,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: category.image,
                ))
          ],
        ),
      ),
    );
  }
}