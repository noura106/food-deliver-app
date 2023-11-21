
import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme.dart';
import 'package:food_delivery_app/screens/location_screen.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});
  static const String routeName='/deliver_time';
  static Route route(){
    return MaterialPageRoute(builder: (_)=> const VoucherScreen(),settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title:  Text('Vocher ',style: theme().textTheme.displayMedium,)),body: Center(
      child: ElevatedButton(child: const Text('location Screen'),onPressed: ()=>Navigator.pushNamed(context, LocationScreen.routeName)),
    ),);
  }
}
