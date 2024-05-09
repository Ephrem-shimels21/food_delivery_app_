import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class CheckOutCard extends StatefulWidget {
  final String image;
  final String name;
  final String restaurant;
  final int price;
  const CheckOutCard(
      {super.key,
      required this.image,
      required this.name,
      required this.restaurant,
      required this.price});

  @override
  State<CheckOutCard> createState() => _CheckOutCardState();
}

class _CheckOutCardState extends State<CheckOutCard> {
  int orderNumber = 1;
  Color buttonColor = UniversalColors.primary;
  Color cardColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(widget.image,
                  width: 80, height: 80, fit: BoxFit.cover),
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
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                      Text('\$${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                onPressed: () {
                  setState(() {
                    buttonColor = buttonColor == UniversalColors.primary
                        ? Colors.green
                        : UniversalColors.primary;
                    cardColor =
                        cardColor == Colors.white ? Colors.grey : Colors.white;
                  });
                },
                child: const Text('Process',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
