
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/screens/location_screen.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});
  static const String routeName='/check_out';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> const CheckOutScreen(),settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  Text('Check Out',style: theme().textTheme.displayMedium,)),body: Center(
      child: ElevatedButton(child: const Text('location Screen'),onPressed: ()=>Navigator.pushNamed(context, LocationScreen.routeName)),
    ),);
  }
}
