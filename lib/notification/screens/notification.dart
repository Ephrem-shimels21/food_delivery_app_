import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/notification/widgets/notification_card.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => NotificationPageState();
}

class NotificationPageState extends State<NotificationPage> {
  List notifications = [
    {
      "message": "Your order has been taken by the driver",
      "time": "Recently",
      "icon": Icons.check_circle,
      "color": UniversalColors.primary,
    },
    {
      "message": "TopUp for \$100 was successful",
      "time": "10.00 AM",
      "icon": Icons.attach_money_rounded,
      "color": Colors.amber,
    },
    {
      "message": "Your order has been cancelled",
      "time": "22 April 2024",
      "icon": Icons.cancel,
      "color": Colors.red,
    },
  ];
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
                      "Notification",
                      style: TextStyle(
                        color: UniversalColors.primaryText,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    )
                  ]))
        ]),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: notifications.length,
          itemBuilder: ((context, index) {
            var notification = notifications[index];
            return Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: NotificationCard(notification: notification));
          }),
        )
      ],
    )));
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
