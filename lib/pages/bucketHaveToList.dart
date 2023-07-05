import 'package:flutter/material.dart';
import 'package:flutter_application_1/Util/colorList.dart';
import 'package:flutter_application_1/pages/bucketEdit.dart';
import 'package:provider/provider.dart';

import '../BucketListItem.dart';
import '../BucketListItem_service.dart';

// "하고싶어요" 버킷리스트 작성목록
class BucketHaveToList extends StatelessWidget {
  const BucketHaveToList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketListItemService>(
        builder: (context, bucketListItemService, child) {
      List<BucketListItem> bucketList = bucketListItemService.bucketList;
      return ListView.builder(
        itemCount: bucketList.length,
        itemBuilder: (context, index) {
          final item = bucketList[index];
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Dismissible(
                key: Key(item.content),
                background: Container(
                  color: ColorList().orange,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                direction: DismissDirection.startToEnd,
                confirmDismiss: (DismissDirection direction) async {
                  if (direction == DismissDirection.startToEnd) {
                    // Show confirmation dialog here if needed
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('버킷리스트 수정'),
                          content: Text('버킷리스트를 수정하시겠습니까?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BucketEdit()),
                                ).then(
                                  (value) {
                                    Navigator.pop(
                                        context); // Close the dialog popup
                                  },
                                );
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(false),
                              child: Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                  return false;
                },
                child: ListTile(
                  title: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          bucketListItemService.changeCheckBox(index);
                        },
                        icon: Icon(
                          bucketListItemService.bucketList[index].isCompleted
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
                                  TextEditingController(text: item.content);
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
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
