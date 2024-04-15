import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class PopularMenuList extends StatelessWidget {
  final Map food;
  final VoidCallback onTap;
  const PopularMenuList({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
        width: media.width * 0.9,
        height: media.height * 0.1,
        margin: const EdgeInsets.all(20),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(food['image'].toString(),
                    width: 80, height: 80, fit: BoxFit.cover),
                Column(
                  children: [
                    Text(food['name'],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: UniversalColors.primaryText,
                        )),
                    Text(food['restaurant'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: UniversalColors.secondaryText,
                        )),
                  ],
                ),
                Text('${food['price']} birr',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: UniversalColors.primary,
                    )),
              ],
            )));
  }
}
