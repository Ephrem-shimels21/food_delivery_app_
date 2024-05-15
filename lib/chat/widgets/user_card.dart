import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';

class ChatCard extends StatelessWidget {
  final Map<String, dynamic> users;

  const ChatCard({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final encodedName = Uri.encodeComponent(users['name']);
        final encodedImage = Uri.encodeComponent(users['photo']);
        router.push('/chatRoom/$encodedName/$encodedImage');
      },
      child: Card(
        color: Colors.white,
        elevation: 3.0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image.asset(
                users['photo'] ?? "assets/img/person.jpg",
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(users['name'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(users['message'] ?? ''),
                ],
              ),
            ),
            Text(users['time'] ?? ''),
          ],
        ),
      ),
    );
  }
}
