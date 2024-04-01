import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(const Duration(seconds: 2));
    router.go('/onboarding1');
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/img/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
    );
  }
}
