import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/filters/filter_bloc.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/screens/location_screen.dart';
import 'package:food_delivery_app/screens/restaurant_listing_screen.dart';
import 'package:food_delivery_app/widgets/widgets.dart';

import '../models/models.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const FilterScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is FilterLoaded) {
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: const RoundedRectangleBorder(),
                        backgroundColor: Theme.of(context).primaryColor
                      ),
                      child: Text('Apply'),
                      onPressed: () {
                        var categories = state.filter.categoryFilterModel
                            .where((filter) => filter.value)
                            .map((filter) => filter.category.name)
                            .toList();

                        var prices = state.filter.priceFilter
                            .where((filter) => filter.value)
                            .map((filter) => filter.price.price)
                            .toList();

                        List<Restaurant> restaurants = Restaurant.restaurants
                            .where(
                              (restaurant) => categories.any(
                                (category) => restaurant.tags.contains(category),
                          ),
                        )
                            .where(
                              (restaurant) => prices.any(
                                (price) =>
                                restaurant.priceCategory.contains(price),
                          ),
                        )
                            .toList();

                        Navigator.pushNamed(
                          context,
                          RestaurantListingScreen.routeName,
                          arguments: restaurants,
                        );
                      },
                    );
                  } else {
                    return Text('Something went wrong.');
                  }
                },
              ),
            ],
          )),

        appBar: AppBar(
            title: Text(
          'Filter ',
          style: theme().textTheme.displaySmall?.copyWith(color: Colors.white),
        )),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Price',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const CustomPriceFilter(),
              Text(
                'Category',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const CustomCategoryFilter()
            ],
          ),
        ));
  }
}
