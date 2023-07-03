import 'package:flutter/material.dart';

import 'main.dart';

// Memo 데이터의 형식을 정해줍니다. 추후 isPinned, updatedAt 등의 정보도 저장할 수 있습니다.

class BucketListItem {
  BucketListItem({
    this.isCompleted = false,
    required this.content,
  });

  String content;
  bool isCompleted;
}

// Memo 데이터는 모두 여기서 관리
class BucketListItemService extends ChangeNotifier {
  List<BucketListItem> bucketList = [
    //BucketListItem(content: ),
  ];

  addItem({required String content}) {
    bucketList.add(BucketListItem(content: content));
    notifyListeners(); //Consumer<MemoService>의 builder 부분을 호출해서 화면 새로고침
  }

  updateItem({required int index, required String content}) {
    bucketList[index].content = content;
    notifyListeners();
  }

  removeItem({required int index}) {
    bucketList.removeAt(index);
    notifyListeners();
  }
}
