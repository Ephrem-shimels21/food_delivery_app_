import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

enum RectangleButtonType { filled, outlined }

class RectangleButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final RectangleButtonType type;
  final double? width;
  final double? height;
  final double fontSize;
  final Widget? left;

  const RectangleButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.type = RectangleButtonType.filled,
    this.width,
    this.height,
    this.fontSize = 16,
    this.left,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return InkWell(
        onTap: onPressed,
        child: Container(
            height: height ?? media.height * 0.08,
            width: width ?? media.width * 0.3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: type == RectangleButtonType.filled
                  ? null
                  : Border.all(color: UniversalColors.primary),
              color: type == RectangleButtonType.filled
                  ? UniversalColors.primary
                  : Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (left != null) left!,
                  Text(
                    text,
                    style: TextStyle(
                      color: type == RectangleButtonType.filled
                          ? Colors.white
                          : UniversalColors.primaryText,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ])));
  }
}
