//버켓 수정페이지.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class BucketEdit extends StatefulWidget {
  @override
  _BucketEditState createState() => _BucketEditState();
}

class _BucketEditState extends State<BucketEdit> {
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorList().gray,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Center(
              child: Container(
                height: 100,
                child: Expanded(
                  child: Image.asset('assets/images/home_img.png'),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "   제목 \u{1F4CC}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Colors.white, // 아웃라인흰색으로 변경
                  ),
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
              onTap: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2024),
                );
                setState(() {});
              },
              child: TextField(
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
                      selectedDate = await showDatePicker(
                        //달력팝업 후 날짜선택부분
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2099),
                      );
                      setState(() {});
                    },
                  ),
                ),
                controller: TextEditingController(
                  text: selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                      : '',
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "   내용 \u{1F50D}",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3),
            TextField(
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
                  Navigator.of(context).pop();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => Home()), //home화면으로전환
                  // );
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // 반지름 값을 조정하여 동그란 모양으로 설정
                    ),
                    backgroundColor: ColorList().orange // 오렌지색 설정
                    ),
                child: Text(
                  '버킷리스트 등록 \u{1F4DD}',
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
