import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/food/widgets/order_card.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  double subTotal = 0;
  int discount = 10;
  int deliveryCharge = 5;
  List Orders = [
    {
      "image": "assets/img/m_res_1.png",
      "name": "Minute by tuk tuk",
      "restaurant": "Good Food",
      "price": 12
    },
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
  void initState() {
    super.initState();
    for (var order in Orders) {
      addSubTotal(order["price"]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
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
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                      "Order details",
                      style: TextStyle(
                        color: UniversalColors.primaryText,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    )
                  ]))
        ]),
        // SizedBox(height: media.height * 0.01),
        SingleChildScrollView(
            child: Column(
          children: [
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: Orders.length,
                itemBuilder: ((context, index) {
                  var food = Orders[index] as Map? ?? {};

                  return OrderCard(
                      image: food["image"] as String? ?? "",
                      name: food["name"] as String? ?? "",
                      restaurant: food["restaurant"] as String? ?? "",
                      price: (food["price"] as num).toInt());
                })),
          ],
        )),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: UniversalColors.primary,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('SubTotal:',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('\$${subTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Discount:',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                  Text('\$${discount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Delivery charge:',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text('\$${deliveryCharge.toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Total:',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(
                      '\$${(subTotal - discount + deliveryCharge).toStringAsFixed(2)}',
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: RectangleButton(
                          type: RectangleButtonType.outlined,
                          text: "Place Order",
                          width: media.width * 0.8,
                          onPressed: () {})))
            ],
          ),
        ),
      ],
    )));
  }

  addSubTotal(price) {
    setState(() {
      subTotal += price;
    });
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
