import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/filters/filter_bloc.dart';


class CustomCategoryFilter extends StatelessWidget {

  const CustomCategoryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is FilterLoaded) {
          return ListView.builder(
              itemCount: state.filter.categoryFilterModel.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        state.filter.categoryFilterModel[index].category.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Checkbox(
                          value: state.filter.categoryFilterModel[index].value,
                          onChanged: (bool? value) {
                            context.read<FilterBloc>().add(CategoryFilterLoaded(
                                categoryFilterModel: state
                                    .filter.categoryFilterModel[index]
                                    .copyWith(
                                        value: !state
                                            .filter
                                            .categoryFilterModel[index]
                                            .value)));
                          }),
                    ],
                  ),
                );
              });
        } else
          return Text('some thing went wrong');
      },
    );
  }
}
