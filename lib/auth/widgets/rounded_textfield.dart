import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? bgColor;
  final Widget? left;
  final Widget? right;
  final String? labeltext;
  final List<TextInputFormatter>? inputFormatter;
  final FloatingLabelBehavior? floatingLabelBehavior;

  const RoundTextfield({
    super.key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.bgColor,
    this.left,
    this.right,
    this.inputFormatter,
    this.floatingLabelBehavior,
    this.labeltext,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(7)),
        child: TextField(
          inputFormatters: inputFormatter,
          obscureText: obscureText,
          cursorColor: Colors.blue,
          autocorrect: false,
          controller: controller,
          decoration: InputDecoration(
              labelText: labeltext,
              floatingLabelBehavior:
                  floatingLabelBehavior ?? FloatingLabelBehavior.never,
              prefixIcon: left,
              suffixIcon: right,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: UniversalColors.palceholder,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              )),
        ));
  }
}
