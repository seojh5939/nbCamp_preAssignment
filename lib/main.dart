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
    bool isChecked = false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                titleImageText("버킷리스트"),
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
                Expanded(
                  child: ListView.builder(
                    itemCount: bucketList.length,
                    itemBuilder: (context, index) {
                      final item = bucketList[index];
                      return ListTile(
                        title: Text(item.title),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    TextEditingController controller =
                                        TextEditingController(text: item.title);
                                    return AlertDialog(
                                      title: Text('추가하기'),
                                      content: TextField(
                                        controller: controller,
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            updateItem(index, controller.text);
                                            Navigator.pop(context);
                                          },
                                          child: Text('저장'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('취소'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('삭제하기'),
                                      content: Text('지우시겠습니까?'),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            removeItem(index);
                                            Navigator.pop(context);
                                          },
                                          child: Text('삭제하기'),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('취소하기'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
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
