import 'dart:io';
import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImageDisplayPage extends StatefulWidget {
  final File image;

  const ImageDisplayPage({super.key, required this.image});

  @override
  ImageDisplayPageState createState() => ImageDisplayPageState();
}

class ImageDisplayPageState extends State<ImageDisplayPage> {
  late File _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
        body: Column(children: [
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
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                "Upload Your Photo Profile",
                style: TextStyle(
                  color: UniversalColors.primaryText,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: media.height * 0.02),
              Text(
                "This data will be displayed in your profile for security",
                style: TextStyle(
                  color: UniversalColors.secondaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ]))
      ]),
      SizedBox(height: media.height * 0.08),
      Stack(
        children: <Widget>[
          Container(
            width: 250.0, // Set the width of the image
            height: 250.0, // Set the height of the image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(_image),
                fit: BoxFit.cover,
              ),
              border: Border.all(
                // Add this line
                color: Colors.grey,
                width: 3.0,
              ),
              boxShadow: [
                // Add this line
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: IconButton(
              icon: const Icon(Icons.close),
              onPressed: () {
                // setState(() {
                //   _image = null;
                // });
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
      SizedBox(height: media.height * 0.1),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: RectangleButton(
              text: "Next",
              onPressed: () {
                GoRouter.of(context).push('/setLocation');
              }))
    ]));
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
