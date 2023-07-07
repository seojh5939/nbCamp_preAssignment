//버켓 수정페이지.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem.dart';
import 'package:flutter_application_1/BucketListItem_service.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:flutter_application_1/pages/home.dart';
import '../alarm_Service.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

class BucketEdit extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  BucketEdit(
      {super.key,
      required this.bucketList,
      required this.index,
      required this.isCreat});

  final int index;
  final List<BucketListItem> bucketList;
  final bool isCreat;

  @override
  Widget build(BuildContext context) {
    BucketListItemService bucketListItemService =
        context.read<BucketListItemService>();
    BucketListItem bucketListItem = bucketListItemService.bucketList[index];
    contentController.text = bucketListItem.content;
    titleController.text = bucketListItem.title;
    dateController.text = bucketListItem.dttm;

    final ThemeData theme = Theme.of(context); // 테마 가져오기 추가

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
              onTap: () {},
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
                    onPressed: () {
                      //달력팝업 후 날짜선택부분
                      Future<DateTime?> selectedDate = showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget? child) {
                          return Theme(
                            data: theme.copyWith(
                              colorScheme: theme.colorScheme.copyWith(
                                primary: const Color.fromARGB(
                                    255, 251, 212, 127), // 달력 헤더의 색상 변경
                                onPrimary: Colors.white, // 달력 헤더 텍스트 색상 변경
                                onSurface: Colors.orange, // 선택한 날짜의 색상 변경
                              ),
                              textTheme: theme.textTheme.copyWith(
                                displayLarge: TextStyle(
                                  color: ColorList().yellow, // 달력 날짜 텍스트 색상 변경
                                ),
                              ),
                            ),
                            child: child!,
                          );
                        },
                      );
                      selectedDate.then((date) {
                        if (date == null) {
                          return null;
                        }
                        dateController.text =
                            DateFormat('yyyy-MM-dd').format(date);
                        bucketListItemService.updateItem(
                            index: index,
                            title: titleController.text,
                            content: contentController.text,
                            dttm: dateController.text);
                      });
                    },
                  ),
                ),
                controller: dateController,
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
              onPressed: () {
                final DateFormat formatter = DateFormat('yyyy-MM-dd');
                final String formatted = formatter.format(DateTime.now());
                final DateTime datetime = DateTime.parse(formatted);
                Future<TimeOfDay?> future = showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.fromDateTime(datetime),
                );
                // TODO hour && min 값 이상함. 고쳐야 됨.
                future.then((timeOfDay) {
                  if (timeOfDay == null) {
                    return null;
                  } else {
                    context.read<AlarmService>().addAlarmItem(
                          year: datetime.year.toString(),
                          month: datetime.month.toString(),
                          day: datetime.day.toString(),
                          hour: datetime.hour.toString(),
                          min: datetime.minute.toString(),
                        );
                    print(datetime.day.toString());
                  }
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: context.watch<AlarmService>().alarmList.isNotEmpty
                        ? Text(
                            "${context.watch<AlarmService>().alarmList[0].year}년${context.watch<AlarmService>().alarmList[0].month}월${context.watch<AlarmService>().alarmList[0].day}일 ${context.watch<AlarmService>().alarmList[0].hour}시${context.watch<AlarmService>().alarmList[0].month}분",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          )
                        : Text(
                            "알람 설정",
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
                  if (titleController.text.isEmpty ||
                      contentController.text.isEmpty) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('빈칸이 존재합니다!'),
                          content: Text('빈칸을 채워주세요!'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    bucketListItemService.updateItem(
                      index: index,
                      title: titleController.text,
                      content: contentController.text,
                      dttm: dateController.text,
                    );

                    Navigator.of(context).pop();
                  }
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
            SizedBox(
              height: 30,
            ),
            Center(
              child: IconButton(
                onPressed: () {
                  if (isCreat == true) {
                    bucketListItemService.removeItem(index: index);
                    Navigator.pop(context); // Close the dialog
                  } else {
                    Navigator.pop(context); // Close the dialog
                  }
                },
                icon: Icon(
                  Icons.cancel,
                  color: Colors.white,
                  shadows: [],
                ),
                iconSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
