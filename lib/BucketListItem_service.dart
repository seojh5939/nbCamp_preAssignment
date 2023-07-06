import 'dart:convert';

import 'package:flutter/material.dart';

import 'BucketListItem.dart';
import 'main.dart';

/// 데이터는 모두 여기서 관리
class BucketListItemService extends ChangeNotifier {
  BucketListItemService() {
    //loadBucketItem();
  }

  /// "달성했어요" 확인
  bool isDone = false;

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

  saveBucketItem() {
    List bucketItemJson = bucketList.map((item) => item.toJson()).toList();
    String json = jsonEncode(bucketItemJson);
    prefs.setString('bucketList', json);
  }

  loadBucketItem() {
    String? json = prefs.getString('bucketList');
    if (json == null) return;

    List bucketJsonList = jsonDecode(json);
    bucketList =
        bucketJsonList.map((json) => BucketListItem.fromJson(json)).toList();
  }

  /// 체크박스 클릭시 체크 or 체크해제
  changeCheckBox(int index) {
    bucketList[index].isCompleted = !bucketList[index].isCompleted;
    notifyListeners();
  }

  /// "하고싶어요", "달성했어요" 버튼클릭시 상태값 변경
  isClickedBucketListButton() {
    isDone = !isDone;
    notifyListeners();
  }

  /// 완료되지않은 버킷목록 개수 출력
  String printBucketListCount() {
    return bucketList
        .where((element) {
          return element.isCompleted == false;
        })
        .length
        .toString();
  }

  /// 완료된 버킷 목록 개수출력
  String printBucketDoneListCount() {
    return bucketList
        .where((element) {
          return element.isCompleted == true;
        })
        .length
        .toString();
  }
}
