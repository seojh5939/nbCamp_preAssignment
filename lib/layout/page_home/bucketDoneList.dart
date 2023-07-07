import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/page_home/done/doneListItem_Layout.dart';
import 'package:provider/provider.dart';

import '../../model/BucketListItem.dart';
import '../../service/BucketListItem_service.dart';

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
                : Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(),
                    ),
                  );
          });
    });
  }
}
