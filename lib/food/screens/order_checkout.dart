import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/auth/widgets/rounded_textfield.dart';
import 'package:food_delivery_appb/common/clipper_path.dart';
import 'package:food_delivery_appb/food/widgets/checkout_orderCard.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOut();
}

class _CheckOut extends State<CheckOut> {
  TextEditingController searchController = TextEditingController();

  List orders = [
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
                          onPressed: () {}))
                ],
              ))
        ],
      ),
      Expanded(
          child: SingleChildScrollView(
              child: Column(
        children: [
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              itemCount: orders.length,
              itemBuilder: ((context, index) {
                var food = orders[index] as Map? ?? {};

                return CheckOutCard(
                    image: food["image"] as String? ?? "",
                    name: food["name"] as String? ?? "",
                    restaurant: food["restaurant"] as String? ?? "",
                    price: (food["price"] as num).toInt());
              })),
        ],
      ))),
      Container(
          margin: const EdgeInsets.all(20),
          child: RectangleButton(
            text: "Checkout",
            width: media.width * 0.9,
            onPressed: () {
              router.go('/home');
            },
          ))
    ]));
  }
}
