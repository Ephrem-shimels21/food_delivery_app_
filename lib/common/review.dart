import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class Review extends StatelessWidget {
  final Map review;
  final VoidCallback onTap;
  const Review({super.key, required this.review, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Image.asset(
                review['image'].toString(),
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              Text(
                review['name'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: UniversalColors.primaryText,
                ),
              )
            ]),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: UniversalColors.primary.withOpacity(0.2),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: UniversalColors.primary,
                    size: 12,
                  ),
                  Text(
                    '${review['rate']}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w800,
                      color: UniversalColors.primary,
                    ),
                  ),
                ],
              ),
            )
          ]),
          Text(
            review['comment'],
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: UniversalColors.secondaryText,
            ),
          ),
        ],
      ),
    );
  }
}
