import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool _isHiddenNew = true;
  bool _isHiddenConfirm = true;

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
                  "Reset your password\n here",
                  style: TextStyle(
                    color: UniversalColors.primaryText,
                    fontWeight: FontWeight.w800,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: media.height * 0.01),
                Text(
                  "Enter your new password below",
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
                        controller: newPasswordController,
                        hintText: "New Password",
                        obscureText: _isHiddenNew,
                        left:
                            const Icon(Icons.lock_rounded, color: Colors.blue),
                        right: IconButton(
                            icon: Icon(
                              _isHiddenNew
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                _isHiddenNew = !_isHiddenNew;
                              });
                            }),
                      ),
                      SizedBox(height: media.height * 0.03),
                      RoundTextfield(
                        controller: confirmPasswordController,
                        hintText: "Confirm Password",
                        obscureText: _isHiddenConfirm,
                        left:
                            const Icon(Icons.lock_rounded, color: Colors.blue),
                        right: IconButton(
                            icon: Icon(
                              _isHiddenConfirm
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            color: Colors.blue,
                            onPressed: () {
                              setState(() {
                                _isHiddenConfirm = !_isHiddenConfirm;
                              });
                            }),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: media.height * 0.3),
                Container(
                    alignment: Alignment.center,
                    child: RectangleButton(
                        text: "Next",
                        width: media.width * 0.3,
                        onPressed: () {
                          GoRouter.of(context).push(
                            '/login',
                          );
                        })),
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
