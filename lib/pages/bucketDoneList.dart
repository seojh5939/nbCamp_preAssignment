import 'package:flutter/material.dart';
import 'package:flutter_application_1/doneListObject.dart';
import 'package:provider/provider.dart';

import '../BucketListItem.dart';
import '../BucketListItem_service.dart';

// 완료한 버킷목록
class BucketDoneList extends StatelessWidget {
  const BucketDoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BucketListItemService>(
        builder: (context, bucketListItemService, child) {
      List<BucketListItem> bucketList = bucketListItemService.bucketList;
      return ListView.builder(
          itemCount: bucketListItemService.bucketList.length,
          itemBuilder: (context, index) {
            return bucketList[index].isCompleted
                ? DoneListObject(
                    content: bucketListItemService.bucketList[index].title)
                : Container();
          });
    });
  }
}
