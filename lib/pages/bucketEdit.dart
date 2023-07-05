//버켓 수정페이지.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Util/colorList.dart';

class BucketEdit extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList().gray,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              height: 100,
              child: Expanded(
                child: Image.asset('assets/images/home_img.png'),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Title',
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              //팝업기능 구현해야함
              child: IgnorePointer(
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    hintText: 'Date',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Content',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BucketEdit()), //Edit화면으로전환
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(50), // 반지름 값을 조정하여 동그란 모양으로 설정
                  ),
                  backgroundColor: ColorList().orange // 오렌지색 설정
                  ),
              child: Text(
                '버킷리스트 등록!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
