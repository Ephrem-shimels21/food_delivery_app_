// notification_card.dart

import 'package:flutter/material.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';

class NotificationCard extends StatelessWidget {
  final Map<String, dynamic> notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        elevation: 5.0,
        child: ListTile(
          leading: Icon(
            notification['icon'],
            color: notification['color'],
          ),
          title: Text(
            notification['message'],
            style: TextStyle(
                fontWeight: FontWeight.w800,
                color: UniversalColors.primaryText),
          ),
          subtitle: Text(
            notification['time'],
            style: TextStyle(
                color: UniversalColors.secondaryText,
                fontWeight: FontWeight.w400),
          ),
        ));
  }
}
