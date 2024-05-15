import 'package:flutter/material.dart';
import 'package:food_delivery_appb/chat/widgets/user_call.dart';
import 'package:food_delivery_appb/utils/color_extension.dart';
import 'package:go_router/go_router.dart';

class ChatRoomPage extends StatefulWidget {
  final String chatName;
  final String imageUrl;

  const ChatRoomPage(
      {super.key, required this.chatName, required this.imageUrl});

  @override
  ChatRoomPageState createState() => ChatRoomPageState();
}

class ChatRoomPageState extends State<ChatRoomPage> {
  final TextEditingController _controller = TextEditingController();
  final List<String> _messages = ['Hello', 'Hi', 'How are you?'];

  void _addMessage() {
    setState(() {
      _messages.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      margin: EdgeInsets.zero,
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
                      "Chat",
                      style: TextStyle(
                        color: UniversalColors.primaryText,
                        fontWeight: FontWeight.w800,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: media.height * 0.01),
                    UserCall(name: widget.chatName, photo: widget.imageUrl)
                  ]))
        ]),
        SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: media.height * 0.5,
                child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: index % 2 == 0 ? Colors.blue : Colors.green,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          _messages[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, -3),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: 'Type a message',
                            border: InputBorder.none),
                      ),
                    ),
                    Transform.rotate(
                      angle: -45 * 3.14 / 180,
                      child: IconButton(
                        icon: const Icon(Icons.send_outlined),
                        onPressed: _addMessage,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ]),
    ));
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
