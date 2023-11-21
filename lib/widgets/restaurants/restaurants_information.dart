import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/widgets/home/restaurant_tags.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(
            height: 10,
          ),
          RestaurantTags(restaurant: restaurant),
          SizedBox(
            height: 5,
          ),
          Text(
            '${restaurant.distance} km away - \$${restaurant.deliveryFee} delivery Fee',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'hnskcmcmlvlvldmvlmdvlmvlmvlvmlvmls,;.w[wldpwd;,c;,s',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          ListView.builder(
            shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildMenuItem(restaurant, context, index);
              },
              itemCount: restaurant.tags.length,
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
      Restaurant restaurant, BuildContext context, int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(restaurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Theme.of(context).primaryColor)),
      ),
      Column(
          children: restaurant.menuItems
              .where((menuItem) => menuItem.category == restaurant.tags[index])
              .map((menuItem) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense:true,
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            menuItem.name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          subtitle: Text(
                            menuItem.description,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('\$${menuItem.price}',style: Theme.of(context).textTheme.bodySmall,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.add_circle,color: Theme.of(context).primaryColor,))
                            ],
                          ),
                        ),
                      ),
                      Divider(height: 4,),
                    ],
                  ))
              .toList())
    ]);
  }
}
