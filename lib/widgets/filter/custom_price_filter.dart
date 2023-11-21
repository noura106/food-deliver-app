import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/filters/filter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilter
                .asMap()
                .entries
                .map((price) => InkWell(
                      onTap: () {
                        context.read<FilterBloc>().add(
                          PriceFilterLoaded(
                              priceFilter: state
                                  .filter.priceFilter[price.key]
                                  .copyWith(
                                      value: !state.filter
                                          .priceFilter[price.key].value)));
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: state.filter.priceFilter[price.key].value
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          state.filter.priceFilter[price.key].price.price,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                    ))
                .toList(),
          );
        } else
          return Text('some thing went wrong');
      },
    );
  }
}
