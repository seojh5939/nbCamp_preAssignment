import 'package:flutter/material.dart';
import 'package:flutter_application_1/layout/page_home/haveTo/bucketHaveTo_dismissible.dart';
import 'package:provider/provider.dart';

import '../../model/BucketListItem.dart';
import '../../service/BucketListItem_service.dart';

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
                child: bucketHaveToDismissible(
                  index: index,
                  item: item,
                  bucketListItemService: bucketListItemService,
                ),
              ),
            );
          },
        );
      },
    );
  }
}
