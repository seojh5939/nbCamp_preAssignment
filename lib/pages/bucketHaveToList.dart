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

        return Container(
          child: ListView.builder(
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
                    key: Key(item.title),
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
                              SizedBox(width: 13),
                              Icon(
                                Icons.delete,
                                color: Colors.white,
                              )
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
                              title: Text('MY BUKETLIST'),
                              content: Text('버킷리스트를 수정/삭제 하시겠습니까?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    bucketListItemService.removeItem(
                                        index: index);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    '삭제',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                SizedBox(width: 50),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => BucketEdit(
                                          index: index,
                                          bucketList: bucketList,
                                          isCreat: false,
                                        ),
                                      ),
                                    ).then(
                                      (value) {
                                        Navigator.pop(
                                            context); // Close the dialog popup
                                      },
                                    );
                                  },
                                  child: Text('수정'),
                                ),
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text('취소'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      return false;
                    },
                    child: ListTile(
                      leading: IconButton(
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
                      title: Text(item.title),
                      trailing: Text("\u{23F3} ${item.dttm}   "),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
