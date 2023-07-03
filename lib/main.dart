import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            titleImageText("버킷리스트"),
          ],
        ),
      ),
    );
  }
}

Widget titleImageText(String title) {
  return Stack(
    alignment: Alignment.center,
    children: [
      // Image
      Image.asset('assets/images/banner_Img.png'),
      // Title
      Center(
          child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 48,
        ),
      )),
    ],
  );
}
