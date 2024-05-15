import 'package:flutter/material.dart';

class CallingPage extends StatefulWidget {
  final String userName;
  final String userPhoto;

  const CallingPage(
      {super.key, required this.userName, required this.userPhoto});

  @override
  CallingPageState createState() => CallingPageState();
}

class CallingPageState extends State<CallingPage> {
  Duration _duration = const Duration();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipOval(
              child: Image.asset(
                widget.userPhoto,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: media.height * 0.08,
            ),
            Text(widget.userName,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
            StreamBuilder<int>(
              stream: Stream.periodic(const Duration(seconds: 1), (i) => i),
              builder: (context, snapshot) {
                _duration = Duration(seconds: snapshot.data ?? 0);
                return Text(
                    '${_duration.inMinutes}:${(_duration.inSeconds % 60).toString().padLeft(2, '0')}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400));
              },
            ),
            SizedBox(
              height: media.height * 0.1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.volume_off_sharp,
                          color: Colors.white),
                      onPressed: () {},
                    )),
                SizedBox(
                  width: media.width * 0.1,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
