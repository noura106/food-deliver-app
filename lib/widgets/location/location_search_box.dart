import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/place_autocomplete_bloc/place_auto_complete_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<PlaceAutoCompleteBloc, PlaceAutoCompleteState>(
        builder: (context, state) {
          if (state is PlaceAutoCompleteLoading) {
            return SizedBox.shrink();
          } else if (state is PlaceAutoCompleteLoaded) {
            return TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Enter Your Location',
                  suffixIcon: const Icon(Icons.search),
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 5, right: 5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white))),
              onChanged: (value) => context
                  .read<PlaceAutoCompleteBloc>()
                  .add(LoadPlaceAutoCompleteEvent(searchInput: value)),
            );
          } else
            return Text('some thing went wrong');
        },
      ),
    );
  }
}
