import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/common/clipper_path.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
      Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: ClipPath(
              clipper: CustomClipperPath(),
              child: Image.asset(
                "assets/img/splash_bg.png",
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 60, 30, 20),
            child: Align(
                alignment: Alignment.topRight,
                child: Container(
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 10.0,
                        spreadRadius: 5,
                        offset: Offset(2.0, 2.0),
                      ),
                    ], color: Colors.white, shape: BoxShape.circle),
                    child: IconButton(
                      icon: Icon(Icons.notifications_outlined,
                          color: UniversalColors.primary,
                          size: media.height * 0.05),
                      onPressed: () {},
                    ))),
          ),
          Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text("Find Your\nFavorite Food",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        color: UniversalColors.primaryText,
                        fontFamily: "metropolis",
                        fontWeight: FontWeight.w800,
                      )))),
          Padding(
            padding: const EdgeInsets.only(top: 140),
            child: Container(
                width: media.width * 0.8,
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: RoundTextfield(
                  controller: searchController,
                  hintText: "What do you want to order?",
                  bgColor: UniversalColors.primary.withOpacity(0.2),
                  left: Icon(Icons.search, color: UniversalColors.primary),
                )),
          )
        ],
      ),
      SingleChildScrollView(child: Container()),
    ]));
  }
}
