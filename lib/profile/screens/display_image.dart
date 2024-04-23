import 'dart:io';
import 'package:flutter/material.dart';

class ImageDisplayPage extends StatefulWidget {
  final String image;

  ImageDisplayPage({required this.image});

  @override
  _ImageDisplayPageState createState() => _ImageDisplayPageState();
}

class _ImageDisplayPageState extends State<ImageDisplayPage> {
  String? _image;

  @override
  void initState() {
    super.initState();
    _image = widget.image;
    print('Image path: ${_image}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Stack(
                children: <Widget>[
                  Container(
                    width: 300.0, // Set the width of the image
                    height: 300.0, // Set the height of the image
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(_image!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 10.0,
                    right: 10.0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        setState(() {
                          _image = null;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
