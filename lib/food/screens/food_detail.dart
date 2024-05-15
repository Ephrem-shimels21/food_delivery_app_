import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/common/popular_food.dart';
import 'package:food_delivery_appb/common/review.dart';
import 'package:food_delivery_appb/common/title_view_more.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class FoodDetail extends StatefulWidget {
  final String title;
  final String imagePath;
  const FoodDetail({super.key, required this.title, required this.imagePath});

  @override
  State<FoodDetail> createState() => _FoodDetailState();
}

class _FoodDetailState extends State<FoodDetail> {
  double price = 15;
  int qty = 1;
  bool isFav = false;
  List reviews = [
    {
      "image": "assets/img/person-1.png",
      "name": "John Doe",
      "comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "rate": 4
    },
    {
      "image": "assets/img/person-1.png",
      "name": "Jane Doe",
      "comment": "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "rate": 5
    },
    {
      "image": "assets/img/person-1.png",
      "name": "John Doe",
      "comment":
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
      "rate": 4
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
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              widget.imagePath,
              width: media.width,
              height: media.width,
              fit: BoxFit.cover,
            ),
            Container(
              width: media.width,
              height: media.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.grey,
                  Colors.transparent,
                  Colors.blue.withOpacity(0.3)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: media.width - 60,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 35,
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.only(left: 35, top: 25),
                                  child: Text(
                                    widget.title,
                                    style: TextStyle(
                                        color: UniversalColors.primaryText,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(Icons.place_outlined,
                                              color: UniversalColors.primary),
                                          Text(
                                            "19 km",
                                            style: TextStyle(
                                                color: UniversalColors
                                                    .secondaryText),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Row(
                                        children: [
                                          Icon(Icons.star_half_outlined,
                                              color: UniversalColors.primary),
                                          Text(
                                            "4.8 rating",
                                            style: TextStyle(
                                                color: UniversalColors
                                                    .secondaryText),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 35),
                                  child: Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ornare leo non mollis id cursus. Eu euismod faucibus in leo malesuada",
                                    style: TextStyle(
                                        color: UniversalColors.secondaryText,
                                        fontSize: 12),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 35),
                                  child: TitleAndViewMore(
                                    title: "Popular Menu",
                                    onView: () {
                                      context.push('/popularMenu');
                                    },
                                    isViewMore: true,
                                    isViewLess: false,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    color: Colors.grey.withOpacity(0.1),
                                    height: 200,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: popularMenu.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        var food =
                                            popularMenu[index] as Map? ?? {};
                                        return PopularMenuCard(
                                            restaurant: food,
                                            onTap: () {},
                                            font: 10);
                                      },
                                    )),
                                Container(
                                    color: Colors.grey.withOpacity(0.1),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 15, top: 20),
                                              child: Text("Testimonials",
                                                  style: TextStyle(
                                                      color: UniversalColors
                                                          .primaryText,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w800))),
                                          ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15,
                                                      vertical: 10),
                                              itemCount: reviews.length,
                                              itemBuilder: ((context, index) {
                                                var review =
                                                    reviews[index] as Map? ??
                                                        {};
                                                return Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            bottom: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                    child: Review(
                                                        review: review,
                                                        onTap: () {}));
                                              }))
                                        ]))
                              ]),
                        ),
                      ],
                    ),
                    Container(
                        height: media.width - 30,
                        alignment: Alignment.bottomRight,
                        margin: const EdgeInsets.only(right: 4, top: 15),
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  padding: const EdgeInsets.all(9),
                                  decoration: BoxDecoration(
                                      color: UniversalColors.primary
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text("Popular",
                                      style: TextStyle(
                                          color: UniversalColors.primary,
                                          fontWeight: FontWeight.w800))),
                              Row(
                                children: [
                                  Icon(Icons.place,
                                      color: UniversalColors.primary, size: 35),
                                  InkWell(
                                    onTap: () {
                                      isFav = !isFav;
                                      setState(() {});
                                    },
                                    child: Icon(
                                      isFav
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color: UniversalColors.primary,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              )
                            ]))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      Positioned(
        left: 10,
        top: 10,
        child: Container(
          decoration: BoxDecoration(
            color: UniversalColors.primary.withOpacity(0.5),
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
      ),
      Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
              child: RectangleButton(
            text: "Add To Cart",
            onPressed: () {},
            width: media.width * 0.8,
          ))),
    ]);
  }
}
