import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        child: SizedBox(
            height: 68,
            width: 64,
            child: TextField(
                onChanged: (value) {
                  if (value.length == 1) {
                    FocusScope.of(context).nextFocus();
                  }
                },
                style: Theme.of(context).textTheme.headlineSmall,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                inputFormatters: <TextInputFormatter>[
                  LengthLimitingTextInputFormatter(1),
                  FilteringTextInputFormatter.digitsOnly
                ],
                cursorColor: UniversalColors.primary,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: UniversalColors.primary,
                    ),
                  ),
                ))));
  }
}
