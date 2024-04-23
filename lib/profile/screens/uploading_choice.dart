import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery_appb/auth/widgets/rectangle_button.dart';
import 'package:food_delivery_appb/profile/screens/display_image.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class PhotoUploadingChoice extends StatefulWidget {
  const PhotoUploadingChoice({super.key});

  @override
  State<PhotoUploadingChoice> createState() => PhotoUploadingChoiceState();
}

class PhotoUploadingChoiceState extends State<PhotoUploadingChoice> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;

  Future<void> _getImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = image;
      });
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
        SizedBox(height: media.height * 0.02),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () => _getImage(ImageSource.gallery),
              child: Container(
                width: media.width * 0.8,
                height: media.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the color of the box
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.photo_library,
                        color: UniversalColors.primary, size: 45.0),
                    Text('From Gallery',
                        style: TextStyle(
                            color: UniversalColors.primaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Add some spacing between the boxes
            GestureDetector(
              onTap: () => _getImage(ImageSource.camera),
              child: Container(
                width: media.width * 0.8,
                height: media.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white, // Set the color of the box
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.camera,
                        color: UniversalColors.primary, size: 45.0),
                    Text('Take Photo',
                        style: TextStyle(
                            color: UniversalColors.primaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                  ],
                ),
              ),
            ),
            SizedBox(height: media.height * 0.1),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: RectangleButton(
                    text: "Next",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ImageDisplayPage(
                                    image: ('assets/img/GoodFood.png'),
                                  )));
                    }))
          ],
        )),
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
