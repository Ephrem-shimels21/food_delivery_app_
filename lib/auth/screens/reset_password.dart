import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

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
                  "Forgot Password?",
                  style: TextStyle(
                    color: UniversalColors.primaryText,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Text(
                  "Select which contact details should we\n use to reset your password",
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
                  child: Column(
                    children: [
                      RoundTextfield(
                        controller: phoneController,
                        labeltext: "Via sms",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        keyboardType: TextInputType.number,
                        inputFormatter: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10)
                        ],
                        bgColor: Colors.white,
                        left:
                            const Icon(Icons.chat_rounded, color: Colors.blue),
                      ),
                      SizedBox(height: media.height * 0.03),
                      RoundTextfield(
                        controller: emailController,
                        labeltext: "Via email:",
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        bgColor: Colors.white,
                        left: const Icon(Icons.email, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
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
