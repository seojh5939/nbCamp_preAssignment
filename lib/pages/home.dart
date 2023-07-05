import 'package:flutter/material.dart';
import 'package:flutter_application_1/BucketListItem_service.dart';
import 'package:provider/provider.dart';

import '../BucketListItem.dart';
import 'bucketDoneList.dart';

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
            //titleImageText("버킷리스트 \u{1F60D}"),
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
                      "\n버킷리스트가",
                      style: TextStyle(
                        fontSize: 25,
                        //fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "\"${bucketList.length} 개\"",
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
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // ElevatedButton(
                    //   onPressed: () {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => BucketDoneList()),
                    //     );
                    //   },
                    //   style: ElevatedButton.styleFrom(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(
                    //           50), // 반지름 값을 조정하여 동그란 모양으로 설정
                    //     ),
                    //     backgroundColor:
                    //         Color.fromARGB(255, 251, 212, 127), // 주황색으로 설정
                    //   ),
                    //   child: Text(
                    //     '달성 했어요 \u{1F389}',
                    //     style: TextStyle(
                    //       fontSize: 20,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BucketDoneList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // 반지름 값을 조정하여 동그란 모양으로 설정
                      ),
                      backgroundColor:
                          Color.fromARGB(255, 251, 212, 127), // 주황색으로 설정
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BucketDoneList()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            50), // 반지름 값을 조정하여 동그란 모양으로 설정
                      ),
                      backgroundColor:
                          Color.fromARGB(255, 209, 208, 208), // 주황색으로 설정
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
                      child: ListTile(
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
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),

                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BucketDoneList()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // 반지름 값을 조정하여 동그란 모양으로 설정
                    ),
                    backgroundColor:
                        Color.fromARGB(255, 245, 122, 74), // 주황색으로 설정
                  ),
                  child: Text(
                    '버킷리스트 등록!',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // child: Row(
                //   children: [
                //     Expanded(
                //       child: TextField(
                //         controller: textEditingController,
                //         decoration: InputDecoration(
                //           hintText: '이루고 싶은 것을 입력하세요',
                //         ),
                //       ),
                //     ),
                //     ElevatedButton(
                //       onPressed: () {
                //         bucketListItemService.addItem(
                //           content: textEditingController.text,
                //         );
                //         // 기기에 저장
                //         bucketListItemService.saveBucketItem();
                //         textEditingController.clear();
                //       },
                //       child: Text('기록하기'),
                //     ),
                //   ],
                // ),
              ),
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      );
    });
  }
}
