import 'package:flutter/material.dart';
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
                                        index: index, content: controller.text);
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
          );
        },
      );
    });
  }
}
