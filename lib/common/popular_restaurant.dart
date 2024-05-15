import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class PopularRestaurantGrid extends StatelessWidget {
  final Map restaurant;
  final VoidCallback? onTap;
  final int? font;
  const PopularRestaurantGrid(
      {super.key, required this.restaurant, this.onTap, this.font});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 1,
                offset: const Offset(0, 3),
              )
            ]),
        child: InkWell(
          onTap: onTap ?? onTapping,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(restaurant['image'].toString(),
                  width: 100, height: 100, fit: BoxFit.cover),
              Text(restaurant['name'],
                  style: TextStyle(
                    fontSize: font?.toDouble() ?? 20,
                    fontWeight: FontWeight.w800,
                    color: UniversalColors.primaryText,
                  )),
              Text('${restaurant['time']} min',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: UniversalColors.secondaryText,
                  )),
            ],
          ),
        ));
  }

  onTapping() {
    final encodedName = Uri.encodeComponent(restaurant['name']);
    final encodedImage = Uri.encodeComponent(restaurant['image']);
    router.push('/restaurantDetail/$encodedName/$encodedImage');
  }
}
