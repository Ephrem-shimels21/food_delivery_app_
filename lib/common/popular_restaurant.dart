import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class PopularRestaurantGrid extends StatelessWidget {
  final Map restaurant;
  final VoidCallback onTap;
  const PopularRestaurantGrid(
      {super.key, required this.restaurant, required this.onTap});

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
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(restaurant['image'].toString(),
                  width: 100, height: 100, fit: BoxFit.cover),
              Text(restaurant['name'],
                  style: TextStyle(
                    fontSize: 20,
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
}
