import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class TitleAndViewMore extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  final bool isViewMore;
  final bool isViewLess;
  final int? font;
  const TitleAndViewMore(
      {super.key,
      this.font,
      required this.title,
      required this.isViewLess,
      required this.onView,
      required this.isViewMore});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    color: UniversalColors.primaryText,
                    fontSize: font?.toDouble() ?? 18,
                    fontWeight: FontWeight.w800)),
            if (isViewMore)
              TextButton(
                onPressed: onView,
                child: Text(
                  isViewLess ? 'View Less' : 'View More',
                  style: TextStyle(
                      color: UniversalColors.primary,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              )
          ],
        ));
  }
}
