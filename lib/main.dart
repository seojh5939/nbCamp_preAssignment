import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem_service.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'BucketListItem.dart';
import 'BucketListItem_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BucketListItemService()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketListItemService>(
        builder: (context, bucketListItemService, child) {
      List<BucketListItem> bucketList = bucketListItemService.bucketList;
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(10.0),
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
                            bucketListItemService.addItem(
                              content: textEditingController.text,
                            );
                            textEditingController.clear();
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
                          title: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  bucketListItemService.changeCheckBox(index);
                                },
                                icon: Icon(
                                  bucketListItemService
                                          .bucketList[index].isCompleted
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank_rounded,
                                ),
                                color: Colors.green,
                              ),
                              Text(item.content),
                            ],
                          ),
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
                                          TextEditingController(
                                              text: item.content);
                                      return AlertDialog(
                                        title: Text('수정하기'),
                                        content: TextField(
                                          controller: controller,
                                        ),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              bucketListItemService.updateItem(
                                                  index: index,
                                                  content: controller.text);
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
                                              bucketListItemService.removeItem(
                                                  index: index);
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
                ],
              ),
            ),
          ),
        ),
      );
    });
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
