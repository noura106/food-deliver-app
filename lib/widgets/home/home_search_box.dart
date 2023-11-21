import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/filter_screen.dart';

class HomeSearchBox extends StatelessWidget {
  const HomeSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'What Would you like to eat?',
                  suffixIcon:  Icon(Icons.search,color: Theme.of(context).primaryColor,),
                  contentPadding:
                  const EdgeInsets.only(left: 20, bottom: 5, top: 12.5),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.white))),),
          ),
          const SizedBox(width: 10,),
          Container(
            margin: EdgeInsets.only(right: 5),
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              icon: Icon(Icons.menu,color: Theme.of(context).primaryColor,),
              onPressed: ()=> Navigator.pushNamed(context, FilterScreen.routeName),
            ),
          ),
        ],
      ),
    );
  }
}
