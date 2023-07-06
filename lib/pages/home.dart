import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem_service.dart';
import 'package:flutter_application_1/pages/bucketEdit.dart';
import 'package:provider/provider.dart';

import '../BucketListItem.dart';
import '../Util/colorList.dart';
import '../doneListObject.dart';
import 'bucketDoneList.dart';
import 'bucketHaveToList.dart';

TextEditingController textEditingController = TextEditingController();

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return Consumer<BucketListItemService>(
        builder: (context, bucketListItemService, child) {
      List<BucketListItem> bucketList = bucketListItemService.bucketList;
      return Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\n버킷리스트",
                      style: TextStyle(
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    bucketListItemService.isDone
                        ? Row(
                            children: [
                              Text(
                                "\"${bucketListItemService.printBucketDoneListCount()} 개\"",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                " 완료했어요!",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                "\"${bucketListItemService.printBucketListCount()} 개\"",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                " 남았어요!",
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
                Expanded(
                  child: Image.asset('assets/images/home_img.png'),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 하고싶어요
                  ElevatedButton(
                    onPressed: () {
                      if (bucketListItemService.isDone) {
                        bucketListItemService.isClickedBucketListButton();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // 반지름 값을 조정하여 동그란 모양으로 설정
                      ),
                      backgroundColor: bucketListItemService.isDone
                          ? ColorList().gray
                          : ColorList().yellow, // 주황색으로 설정
                    ),
                    child: Text(
                      '하고 싶어요 \u{1F64F}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  // 달성했어요
                  ElevatedButton(
                    onPressed: () {
                      if (!bucketListItemService.isDone) {
                        bucketListItemService.isClickedBucketListButton();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // 반지름 값을 조정하여 동그란 모양으로 설정
                      ),
                      backgroundColor: bucketListItemService.isDone
                          ? ColorList().yellow
                          : ColorList().gray, // 주황색으로 설정
                    ),
                    child: Text(
                      '달성 했어요 \u{1F389}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: bucketListItemService.isDone
                  ? BucketDoneList()
                  : BucketHaveToList(),
            ),
            Center(
              child: bucketListItemService.isDone
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: ElevatedButton(
                        onPressed: () {
                          bucketListItemService.addItem(title: '', content: '');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => BucketEdit(
                                index:
                                    bucketListItemService.bucketList.length - 1,
                                bucketList: bucketList,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50), // 반지름 값을 조정하여 동그란 모양으로 설정
                          ),
                          backgroundColor: ColorList().orange, // 오렌지색 설정
                        ),
                        child: Text(
                          '버킷리스트 등록 \u{1F4DD}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
            ),
            SizedBox(height: 50),
          ],
        ),
      );
    });
  }
}
