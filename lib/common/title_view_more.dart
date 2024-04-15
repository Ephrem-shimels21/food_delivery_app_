import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class TitleAndViewMore extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  final bool isViewMore;
  const TitleAndViewMore(
      {super.key,
      required this.title,
      required this.onView,
      required this.isViewMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                color: UniversalColors.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w800)),
        if (isViewMore)
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
