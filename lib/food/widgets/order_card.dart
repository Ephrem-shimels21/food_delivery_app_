import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class OrderCard extends StatefulWidget {
  final String image;
  final String name;
  final String restaurant;
  final int price;
  const OrderCard(
      {super.key,
      required this.image,
      required this.name,
      required this.restaurant,
      required this.price});

  @override
  State<OrderCard> createState() => _OrderCardState();
}

class _OrderCardState extends State<OrderCard> {
  int orderNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.name),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {},
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20.0),
        color: Colors.blue,
        child: const Icon(Icons.delete, color: Colors.white, size: 30),
      ),
      child: Card(
        color: Colors.white,
        child: Row(
          children: [
            Image.asset(widget.image, width: 80, height: 80, fit: BoxFit.cover),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                    Text(widget.restaurant,
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey)),
                    Text('\$${widget.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Container(
                    // padding: const EdgeInsets.only(left: 8, right: 8),
                    decoration: BoxDecoration(
                        color: UniversalColors.primary.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        if (orderNumber > 1) {
                          setState(() {
                            orderNumber--;
                          });
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text('-',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )),
                const SizedBox(
                  width: 10,
                ),
                Text(orderNumber.toString(),
                    style: const TextStyle(fontSize: 20)),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: UniversalColors.primary.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          orderNumber++;
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text('+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
