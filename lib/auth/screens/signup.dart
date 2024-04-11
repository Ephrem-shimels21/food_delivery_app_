import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHidden = true;
  bool _keepMeSignedIn = false;
  bool _emailMeAboutSpecialPricing = false;

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
            const Text("Sign Up For Free",
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
                    controller: phoneController,
                    hintText: "Phone number",
                    keyboardType: TextInputType.number,
                    inputFormatter: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10)
                    ],
                    bgColor: Colors.white,
                    left: const Icon(Icons.person, color: Colors.blue),
                  ),
                  SizedBox(height: media.height * 0.03),
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
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Checkbox(
                shape: const CircleBorder(),
                activeColor: Colors.blue,
                value: _keepMeSignedIn,
                onChanged: (bool? value) {
                  setState(() {
                    _keepMeSignedIn = value ?? false;
                  });
                },
              ),
              title: Text('Keep Me Signed In',
                  style: TextStyle(color: UniversalColors.secondaryText)),
            ),
            ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: Checkbox(
                  shape: const CircleBorder(),
                  activeColor: Colors.blue,
                  value: _emailMeAboutSpecialPricing,
                  onChanged: (bool? value) {
                    setState(() {
                      _emailMeAboutSpecialPricing = value ?? false;
                    });
                  },
                ),
                title: Text('Email Me About Special Pricing',
                    style: TextStyle(color: UniversalColors.secondaryText))),
            SizedBox(height: media.height * 0.03),
            RectangleButton(
              text: "Create Account",
              width: media.width * 0.5,
              onPressed: () {},
            ),
            SizedBox(height: media.height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?",
                    style: TextStyle(
                      color: UniversalColors.secondaryText,
                      fontSize: 12,
                    )),
                TextButton(
                    onPressed: () {
                      router.go('/login');
                    },
                    child: Text("Sign In",
                        style: TextStyle(
                          color: UniversalColors.primary,
                          fontSize: 12,
                        )))
              ],
            ),
          ])),
    ));
  }
}
