import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/blocs/geolocation_bloc/gelocation_bloc.dart';
import 'package:food_delivery_app/blocs/place_autocomplete_bloc/place_auto_complete_bloc.dart';
import 'package:food_delivery_app/blocs/place_bloc/place_bloc.dart';
import 'package:food_delivery_app/widgets/location/gmap.dart';
import 'package:food_delivery_app/widgets/location/location_search_box.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const LocationScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<PlaceBloc, PlaceState>(
      builder: (context, state) {
        if (state is PlaceLoading) {
          return Stack(
            children: [
              BlocBuilder<GeLocationBloc, GeLocationState>(
                  builder: (context, state) {
                if (state is GeLocationLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GeLocationLoaded) {
                  return Gmap(
                    lat: state.position.latitude,
                    lng: state.position.longitude,
                  );
                } else
                  return const Text('some Thing Went Wrong');
              }),
              const Location(),
              const SaveButton(),
            ],
          );
        } else if (state is PlaceLoaded) {
          return Stack(
            children: [
              Gmap(
                lat: state.place.lat,
                lng: state.place.lan,
              ),
            ],
          );
        } else
          return Text('some thing went wrong');
      },
    ));
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 40,
        right: 20,
        left: 20,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 70),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor),
            child: Text('save'),
          ),
        ));
  }
}

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 40,
        left: 20,
        right: 20,
        child: SizedBox(
          height: 100,
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/logo.svg',
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Column(
                children: [
                  LocationSearchBox(),
                  BlocBuilder<PlaceAutoCompleteBloc, PlaceAutoCompleteState>(
                    builder: (context, state) {
                      if (state is PlaceAutoCompleteLoading) {
                        return const SizedBox.shrink();
                      } else if (state is PlaceAutoCompleteLoaded) {
                        return Container(
                          height: 300,
                          margin: const EdgeInsets.all(8),
                          color: state.autoComplete.isNotEmpty
                              ? Colors.black.withOpacity(0.3)
                              : Colors.transparent,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () => context.read<PlaceBloc>().add(
                                    LoadPlace(
                                        placeId:
                                            state.autoComplete[index].placeId)),
                                title: Text(
                                  state.autoComplete[index].description,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(color: Colors.white),
                                ),
                              );
                            },
                            itemCount: 3,
                          ),
                        );
                      } else
                        return Text('some thing went wrong');
                    },
                  )
                ],
              )),
            ],
          ),
        ));
  }
}
