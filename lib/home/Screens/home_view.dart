import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/common/clipper_path.dart';
import 'package:food_delivery_appb/common/popular_menu.dart';
import 'package:food_delivery_appb/common/popular_restaurant.dart';
import 'package:food_delivery_appb/common/title_view_more.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeView();
}

class _HomeView extends State<HomeView> {
  TextEditingController searchController = TextEditingController();

  List popularRestaurants = [
    {
      "image": "assets/img/veganLover.png",
      "name": "Vegan Resto",
      "time": 12,
    },
    {
      "image": "assets/img/HealthyFood.png",
      "name": "Healthy Food",
      "time": 16,
    },
    {
      "image": "assets/img/smart_Resto.png",
      "name": "Smart Resto",
      "time": 20,
    },
    {
      "image": "assets/img/GoodFood.png",
      "name": "Good Food",
      "time": 6,
    },
    {
      "image": "assets/img/GoodFood.png",
      "name": "Good Food",
      "time": 6,
    },
  ];

  List popularMenu = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "Minute by tuk tuk",
      "restaurant": "Good Food",
      "price": 12
    },
    {
      "image": "assets/img/m_res_2.png",
      "name": "Café de Noir",
      "restaurant": "Healthy Food",
      "price": 16
    },
    {
      "image": "assets/img/item_1.png",
      "name": "Bakes by Tella",
      "restaurant": "Vegan Resto",
      "price": 20
    },
    {
      "image": "assets/img/item_3.png",
      "name": "Bakes by Tella",
      "restaurant": "Vegan Resto",
      "price": 20
    },
  ];

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
                          color: UniversalColors.primary, size: 30),
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
                        fontSize: MediaQuery.of(context).orientation ==
                                Orientation.portrait
                            ? media.width * 0.09
                            : media.width * 0.035,
                        color: UniversalColors.primaryText,
                        fontFamily: "metropolis",
                        fontWeight: FontWeight.w800,
                      )))),
          Padding(
              padding: EdgeInsets.only(
                  top:
                      MediaQuery.of(context).orientation == Orientation.portrait
                          ? media.height * 0.22
                          : media.height * 0.40,
                  left: 0,
                  right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: media.width * 0.77,
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                      child: RoundTextfield(
                        controller: searchController,
                        hintText: "What do you want to order?",
                        bgColor: UniversalColors.primary.withOpacity(0.2),
                        left:
                            Icon(Icons.search, color: UniversalColors.primary),
                      )),
                  Container(
                      width: media.width * 0.15,
                      margin: const EdgeInsets.only(bottom: 23),
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                      decoration: BoxDecoration(
                        color: UniversalColors.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: IconButton(
                          icon: Icon(Icons.tune_sharp,
                              color: UniversalColors.primary),
                          onPressed: () {
                            context.go('/filteringPage');
                          }))
                ],
              ))
        ],
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
        children: [
          Container(
            width: media.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/img/icecream2.jpg',
                    fit: BoxFit.cover,
                  )),
              const Positioned(
                bottom: 10,
                left: 30,
                child: Text("Special Deal For\n April",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    )),
              )
            ]),
          ),
          SizedBox(height: media.height * 0.02),
          TitleAndViewMore(
            title: "Popular Restaurant",
            onView: () {
              context.go('/popularRestaurants');
            },
            isViewMore: true,
          ),
          SizedBox(height: media.height * 0.02),
          GridView.builder(
              shrinkWrap: true,
              itemCount: 2,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10),
              itemBuilder: (BuildContext context, int index) {
                var restaurant = popularRestaurants[index] as Map? ?? {};
                return PopularRestaurantGrid(restaurant: restaurant);
              }),
          TitleAndViewMore(
            title: "Popular Menu",
            onView: () {
              context.go('/popularMenu');
            },
            isViewMore: true,
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: 1,
              itemBuilder: ((context, index) {
                var food = popularMenu[index] as Map? ?? {};
                return PopularMenuList(food: food);
              }))
        ],
      ))),
    ]));
  }
}
