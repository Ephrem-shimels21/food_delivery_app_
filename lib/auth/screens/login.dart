import "package:flutter/material.dart";
import "package:food_delivery_appb/Route/route.dart";
import "package:food_delivery_appb/auth/widgets/rectangle_button.dart";
import "package:food_delivery_appb/auth/widgets/rounded_textfield.dart";
import "package:food_delivery_appb/utils/color_extension.dart";
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  "assets/img/splash_bg.png",
                  width: media.width,
                  height: media.height * 0.30,
                  fit: BoxFit.cover,
                ),
                Column(children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/img/logo.png",
                      width: media.width * 0.30,
                      height: media.height * 0.20,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SizedBox(height: media.height * 0),
                  Text("MYFood",
                      style: TextStyle(
                        fontSize: 30,
                        color: UniversalColors.primary,
                        fontFamily: "metropolis",
                        fontWeight: FontWeight.w800,
                      )),
                  Text("Deliver Favorite Food",
                      style: TextStyle(
                        // fontSize: 15,
                        fontFamily: "metropolis",
                        fontWeight: FontWeight.w700,
                        color: UniversalColors.secondaryText,
                      )),
                ]),
              ],
            ),
            SizedBox(height: media.height * 0.02),
            const Text("Login To Your Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                  fontFamily: "metropolis",
                )),
            SizedBox(height: media.height * 0.06),
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
                child: Column(children: [
                  RoundTextfield(
                    controller: emailController,
                    hintText: "Email",
                    left: const Icon(Icons.email, color: Colors.blue),
                  ),
                  SizedBox(height: media.height * 0.03),
                  RoundTextfield(
                    controller: passwordController,
                    hintText: "password",
                    obscureText: _isHidden,
                    left: const Icon(Icons.lock_rounded, color: Colors.blue),
                    right: IconButton(
                        icon: Icon(
                          _isHidden ? Icons.visibility : Icons.visibility_off,
                        ),
                        color: Colors.blue,
                        onPressed: () {
                          setState(() {
                            _isHidden = !_isHidden;
                          });
                        }),
                  ),
                  SizedBox(height: media.height * 0.03),
                ])),
            SizedBox(height: media.height * 0.02),
            Text("Or Continue With",
                style: TextStyle(
                  fontFamily: "",
                  color: UniversalColors.primaryText,
                  fontWeight: FontWeight.w900,
                )),
            SizedBox(height: media.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RectangleButton(
                  left: Icon(Icons.facebook, color: UniversalColors.primary),
                  height: media.height * 0.06,
                  width: media.width * 0.3,
                  type: RectangleButtonType.outlined,
                  text: "Facebook",
                  onPressed: () {},
                ),
                RectangleButton(
                  height: media.height * 0.06,
                  width: media.width * 0.3,
                  type: RectangleButtonType.outlined,
                  text: "Google",
                  onPressed: () {},
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  router.go("/passwordReset");
                },
                child: Text("Forgot Your Password ?",
                    style: TextStyle(
                      color: UniversalColors.primary,
                      fontSize: 12,
                    ))),
            SizedBox(height: media.height * 0.03),
            RectangleButton(
              text: "Login",
              onPressed: () {},
            ),
          ])),
    ));
  }
}
