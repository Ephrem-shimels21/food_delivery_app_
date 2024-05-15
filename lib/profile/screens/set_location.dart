import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class SetLocation extends StatefulWidget {
  const SetLocation({super.key});

  @override
  SetLocationState createState() => SetLocationState();
}

class SetLocationState extends State<SetLocation> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
      Stack(children: [
        Align(
          alignment: Alignment.topRight,
          child: ClipPath(
            clipper: CustomClipperPath(),
            child: Image.asset(
              "assets/img/splash_bg.png",
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: media.height * 0.02,
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
              SizedBox(height: media.height * 0.02),
              Text(
                "Set Your Location",
                style: TextStyle(
                  color: UniversalColors.primaryText,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Text(
                "This data will be displayed in your profile for security",
                style: TextStyle(
                  color: UniversalColors.secondaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ]))
      ]),
      SizedBox(height: media.height * 0.08),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 25),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: UniversalColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Your Location",
                    hintStyle: TextStyle(
                      color: UniversalColors.secondaryText,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              Positioned(
                right: 25,
                child: Container(
                  decoration: BoxDecoration(
                    color: UniversalColors.primary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    color: Colors.white,
                    iconSize: 30,
                    padding: const EdgeInsets.all(10),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: media.height * 0.02),
          Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: RectangleButton(
                  text: "Set Location",
                  type: RectangleButtonType.outlined,
                  width: media.width * 0.7,
                  onPressed: () {},
                ),
              ))
        ]),
      ),
      SizedBox(height: media.height * 0.3),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: RectangleButton(
              text: "Next",
              onPressed: () {
                GoRouter.of(context).go('/home');
              }))
    ]));
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
