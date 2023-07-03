import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  titleImageText("버킷리스트"),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          isChecked = !isChecked;
                        },
                        icon: Icon(
                          isChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_rounded,
                        ),
                        color: Colors.green,
                      ),
                      Text("버킷리스트 추가 테스트"),
                      Spacer(),
                      OutlinedButton(
                        onPressed: () {},
                        child: Text("완료!"),
                        style: ButtonStyle(
                          side: MaterialStateProperty.all<BorderSide>(
                            BorderSide(color: Colors.blue),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
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
