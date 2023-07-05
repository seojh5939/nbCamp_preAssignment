import 'package:flutter/material.dart';

// 버킷리스트 완료목록에 사용되는 View
class DoneListObject extends StatelessWidget {
  DoneListObject({
    Key? key,
    required this.content,
  }) : super(key: key);
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blueAccent,
          width: 1.4,
        ),
      ),
      margin: EdgeInsets.all(6),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.camera),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "$content\n 2023년2월28일",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
