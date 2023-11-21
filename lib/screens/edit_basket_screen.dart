
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/screens/location_screen.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({super.key});
  static const String routeName='/edit_basket';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> const EditBasketScreen(),settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  Text('Edit Basket',style: theme().textTheme.displayMedium,)),body: Center(
      child: ElevatedButton(child: const Text('location Screen'),onPressed: ()=>Navigator.pushNamed(context, LocationScreen.routeName)),
    ),);
  }
}
