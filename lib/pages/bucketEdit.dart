//버켓 수정페이지.
import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem.dart';
import 'package:flutter_application_1/BucketListItem_service.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:provider/provider.dart';

class BucketEdit extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  BucketEdit({super.key, required this.bucketList, required this.index});
  final int index;
  final List<BucketListItem> bucketList;
  static String onChangeTitle = "";
  static String onChangeContent = "";
  static String onChangeDttm = "";

  @override
  Widget build(BuildContext context) {
    BucketListItemService bucketListItemService =
        context.read<BucketListItemService>();
    BucketListItem bucketListItem = bucketListItemService.bucketList[index];
    contentController.text = bucketListItem.content;
    titleController.text = bucketListItem.title;

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
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                hintText: '제목을 입력해주세요',
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                onChangeTitle = value;
              },
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
              onChanged: (value) {
                onChangeContent = value;
              },
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (onChangeContent.isEmpty && onChangeContent.isEmpty) {
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
                        title: onChangeTitle,
                        content: onChangeContent);
                    onChangeContent = "";
                    onChangeTitle = "";
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
