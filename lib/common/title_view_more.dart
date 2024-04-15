import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class TitleAndViewMore extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const TitleAndViewMore(
      {super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(title,
            style: TextStyle(
                color: UniversalColors.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w800)),
        TextButton(
          onPressed: onView,
          child: Text(
            'View More',
            style: TextStyle(
                color: UniversalColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
