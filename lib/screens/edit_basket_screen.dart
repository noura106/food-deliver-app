import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/screens/location_screen.dart';

import '../blocs/basket_bloc/basket_bloc.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({super.key});

  static const String routeName = '/edit_basket';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const EditBasketScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Edit Basket',
        style: theme().textTheme.displayMedium,
      )),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                shape: const RoundedRectangleBorder(),
                backgroundColor: Theme.of(context).primaryColor,
              ),
              child: Text('Done',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium
                      ?.copyWith(color: Colors.white)),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Items',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is BasketLoaded) {
                    return state.basket.menuItems.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.basket
                                .itemQuantity(state.basket.menuItems)
                                .keys
                                .length,
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 5),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${state.basket.itemQuantity(state.basket.menuItems).entries.elementAt(index).value}x',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Text(
                                        '${state.basket.itemQuantity(state.basket.menuItems).keys.elementAt(index).name}',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>().add(
                                              RemoveAllItem(
                                                  menuItem: state.basket
                                                      .itemQuantity(state
                                                      .basket.menuItems)
                                                      .keys
                                                      .elementAt(index)));
                                        },
                                        icon: Icon(Icons.delete),
                                        visualDensity: VisualDensity.compact),
                                    IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>().add(
                                              AddItem(
                                                  menuItem: state.basket
                                                      .itemQuantity(state
                                                          .basket.menuItems)
                                                      .keys
                                                      .elementAt(index)));
                                        },
                                        icon: const Icon(Icons.add_circle),
                                        visualDensity: VisualDensity.compact),
                                    IconButton(
                                        onPressed: () {
                                          context.read<BasketBloc>().add(
                                              RemoveItem(
                                                  menuItem: state.basket
                                                      .itemQuantity(state
                                                      .basket.menuItems)
                                                      .keys
                                                      .elementAt(index)));
                                        },
                                        icon: Icon(Icons.remove_circle),
                                        visualDensity: VisualDensity.compact),
                                    Text(
                                      '\$${state.basket.itemQuantity(state.basket.menuItems).keys.elementAt(index).price}',
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )
                        : Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(top: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Text(
                                  'No Items In Basket',
                                  textAlign: TextAlign.left,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )
                              ],
                            ),
                          );
                  } else
                    return const Text('some thing went wrong');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
