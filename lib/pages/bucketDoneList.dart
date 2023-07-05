import 'package:flutter/material.dart';
import 'package:flutter_application_1/doneListObject.dart';
import 'package:provider/provider.dart';

import '../BucketListItem_service.dart';

// 완료한 버킷목록을 보여주는 페이지
class BucketDoneList extends StatelessWidget {
  const BucketDoneList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BucketListItemService>(
          builder: (context, bucketListItemService, child) {
        return SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.deepOrangeAccent,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.network(
                        "https://cdn.pixabay.com/photo/2014/03/25/16/27/checker-flags-297188_1280.png"),
                    Text(
                      "완료했어요!",
                      style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 600,
                child: ListView.builder(
                    itemCount: bucketListItemService.bucketList.length,
                    itemBuilder: (context, index) {
                      return DoneListObject(
                          content:
                              bucketListItemService.bucketList[index].content);
                    }),
              ),
            ],
          ),
        );
      }),
    );
  }
}
