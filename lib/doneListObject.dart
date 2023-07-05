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
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.camera),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      content,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "2023년2월28일",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
