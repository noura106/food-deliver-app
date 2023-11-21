import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/blocs/basket_bloc/basket_bloc.dart';
import 'package:food_delivery_app/blocs/filters/filter_bloc.dart';
import 'package:food_delivery_app/blocs/geolocation_bloc/gelocation_bloc.dart';
import 'package:food_delivery_app/blocs/place_autocomplete_bloc/place_auto_complete_bloc.dart';
import 'package:food_delivery_app/blocs/place_bloc/place_bloc.dart';
import 'package:food_delivery_app/core/app_router.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/reposirories/geolocation/geolocation_repository.dart';
import 'package:food_delivery_app/reposirories/places/place_repository.dart';
import 'package:food_delivery_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
            create: (_) => GeolocationRepository()),
        RepositoryProvider<PlaceAutoCompleteRepo>(
            create: (_) => PlaceAutoCompleteRepo())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<GeLocationBloc>(
              create: (context) => GeLocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeoLocation())),
          BlocProvider<PlaceAutoCompleteBloc>(
              create: (context) => PlaceAutoCompleteBloc(
                  placeAutoCompleteRepo: context.read<PlaceAutoCompleteRepo>())
                ..add(const LoadPlaceAutoCompleteEvent())),
          BlocProvider<PlaceBloc>(
              create: (context) => PlaceBloc(
                  placeAutoCompleteRepo: context.read<PlaceAutoCompleteRepo>())),
          BlocProvider<FilterBloc>(
              create: (context) => FilterBloc()..add(FilterLoad())),
          BlocProvider<BasketBloc>(
              create: (context) => BasketBloc()..add(StartBasket()))
        ],
        child: MaterialApp(
          title: 'Food Delivery App',
          theme: theme(),
          initialRoute: HomeScreen.routeName,
          onGenerateRoute: AppRouter.onGenerateRouting,
        ),
      ),
    );
  }
}
