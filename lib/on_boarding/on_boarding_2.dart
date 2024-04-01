import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class SecondOnBoarding extends StatefulWidget {
  const SecondOnBoarding({super.key});

  @override
  State<SecondOnBoarding> createState() => _FirstOnBoarding();
}

class _FirstOnBoarding extends State<SecondOnBoarding>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Stack(
        children: [
          const Positioned(
            top: 10,
            left: 10,
            child: Icon(Icons.circle, size: 150, color: Colors.blue),
          ),
          const Positioned(
            top: 50,
            right: 30,
            child: Icon(Icons.bubble_chart, size: 60, color: Colors.blue),
          ),
          const Positioned(
            bottom: 30,
            left: 50,
            child:
                Icon(Icons.bubble_chart_rounded, size: 200, color: Colors.blue),
          ),
          ScaleTransition(
            scale: _controller,
            child: Image.asset(
              "assets/img/freshly-grilled-cheeseburger-1.png",
              width: media.width,
              height: media.height * 0.50,
            ),
          ),
        ],
      ),
      const Text("Food Ninja is Where Your\n Comfort Food Lives!",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: Colors.black,
              decoration: TextDecoration.none)),
      const SizedBox(height: 10),
      Text("Enjoy a tast and smooth food delivery at\n your doorstep",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: UniversalColors.secondaryText,
              decoration: TextDecoration.none)),
      const SizedBox(height: 10),
      RectangleButton(
        text: "Next",
        onPressed: () {
          router.go("/signup");
        },
      )
    ])));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
