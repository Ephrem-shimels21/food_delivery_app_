import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class OtpVerification extends StatefulWidget {
  final String phoneNumber;
  const OtpVerification({super.key, required this.phoneNumber});

  @override
  State<OtpVerification> createState() => _OtpVerificationState();
}

class _OtpVerificationState extends State<OtpVerification> {
  TextEditingController otpController = TextEditingController();
  late String otpCode;
  int timer = 60;

  @override
  void initState() {
    super.initState();
    generateOTP();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ClipPath(
              clipper: CustomClipperPath(),
              child: Image.asset(
                "assets/img/splash_bg.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: media.height * 0.05,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: UniversalColors.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back_ios_outlined),
                    color: UniversalColors.primary,
                    iconSize: 30,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: media.height * 0.05),
                Text(
                  "Enter 4-digit\n Verification code",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: UniversalColors.primaryText,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Text(
                  "Code send to ${widget.phoneNumber} \n This code will expired in $timer",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: UniversalColors.secondaryText,
                    fontFamily: "meterpolis",
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: media.height * 0.03),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: RoundTextfield(
                    controller: otpController,
                    hintText: "OTP",
                  ),
                ),
                SizedBox(height: media.height * 0.3),
                Container(
                    alignment: Alignment.center,
                    child: RectangleButton(
                        text: "Next",
                        width: media.width * 0.2,
                        onPressed: () {})),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void generateOTP() {
    otpCode = (1000 + Random().nextInt(9000)).toString();
    sendOTP(widget.phoneNumber, otpCode);
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (this.timer == 0) {
        timer.cancel();
        generateOTP();
        this.timer = 60;
      } else {
        setState(() {
          this.timer--;
        });
      }
    });
  }

  void sendOTP(String phoneNumber, String otpCode) {}
}

class CustomClipperPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
