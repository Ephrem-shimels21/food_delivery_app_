import 'package:flutter/material.dart';
import 'package:food_delivery_appb/Route/route.dart';

import 'package:food_delivery_appb/utils/color_extension.dart';

class UserCall extends StatelessWidget {
  final String name;
  final String photo;

  const UserCall({super.key, required this.name, required this.photo});

  @override
  Widget build(BuildContext context) {
    var isOnline = true;
    var media = MediaQuery.of(context).size;
    return Card(
      color: Colors.white,
      elevation: 1.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(
              photo,
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: media.width * 0.1),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.only(
                      top: 5), // Add some space above the status indicator
                  decoration: BoxDecoration(
                    color: UniversalColors.primary,
                    // This color depends on the user's online status
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: media.width * 0.02),
                if (isOnline)
                  Text("Online",
                      style: TextStyle(color: UniversalColors.primary)),
              ]),
            ],
          ),
          SizedBox(width: media.width * 0.1),
          Container(
              decoration: BoxDecoration(
                color: UniversalColors.palceholder.withOpacity(0.3),
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                icon:
                    Icon(Icons.call, color: UniversalColors.primary, size: 30),
                onPressed: () {
                  final encodedName = Uri.encodeComponent(name);
                  final encodedImage = Uri.encodeComponent(photo);
                  router.push('/callingPage/$encodedName/$encodedImage');
                },
              )),
        ],
      ),
    );
  }
}
