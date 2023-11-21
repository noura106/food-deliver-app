import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/home/promo_custom_clipper.dart';

import '../../models/models.dart';

class PromoBox extends StatelessWidget {
  final Promo promo;
  const PromoBox({super.key,required this.promo});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                image: NetworkImage(promo.imageUrl
               ),
                fit: BoxFit.cover,
              )),
        ),
        ClipPath(
          clipper: PromoCustomClipper(),
          child: Container(
            width: MediaQuery.of(context).size.width - 40,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Theme.of(context).primaryColor,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 10,right: 125),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    promo.title,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                   promo.description,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: Colors.white),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}