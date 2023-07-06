//버켓 수정페이지.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:flutter_application_1/pages/home.dart';

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 100,
                child: Image.asset('assets/images/home_img.png'),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "   제목 \u{1F4CC}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '제목을 입력해주세요',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "   날짜 \u{1F550}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            InkWell(
              //팝업기능 구현해야함
              child: IgnorePointer(
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: '언제까지 달성할까요?',
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: IconButton(
                      icon: Icon(Icons.calendar_today), //달력아이콘
                      onPressed: () async {
                        // 현재 선택된 날짜를 가져옵니다.
                        DateTime? selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        // 선택된 날짜가 있다면 텍스트 필드에 값을 설정합니다.
                        if (selectedDate != null) {
                          dateController.text = selectedDate.toString();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            // 알림기능
            Text(
              "   알림 \u{23F0}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              color: Colors.white,
              minWidth: double.infinity,
              height: 45,
              onPressed: () => {
                showTimePicker(context: context, initialTime: TimeOfDay.now()),
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "23년7월6일 오전 11시00분",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              "   내용 \u{1F50D}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            TextField(
              controller: contentController,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '내용을 입력해주세요',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
