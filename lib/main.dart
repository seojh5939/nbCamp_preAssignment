import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class BucketListItem {
  String title;
  bool isCompleted;

  BucketListItem({required this.title, this.isCompleted = false});
}

class MyApp extends StatelessWidget {
  final List<BucketListItem> bucketList = [];

  final TextEditingController textEditingController = TextEditingController();

  void addItem(String title) {
    bucketList.add(BucketListItem(title: title));
    textEditingController.clear();
  }

  void updateItem(int index, String newTitle) {
    bucketList[index].title = newTitle;
  }

  void removeItem(int index) {
    bucketList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      decoration: InputDecoration(
                        hintText: '이루고 싶은 것을 입력하세요',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      addItem(textEditingController.text);
                    },
                    child: Text('기록하기'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
