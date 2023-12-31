import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/BucketListItem.dart';
import '../model/alarm.dart';
import '../main.dart';

/// 데이터는 모두 여기서 관리
class BucketListItemService extends ChangeNotifier {
  BucketListItemService() {
    loadBucketItem();
  }

  /// "달성했어요" 확인
  bool isDone = false;

  List<BucketListItem> bucketList = [];

  addItem(
      {required String title,
      required String content,
      required String dttm,
      required String alarmDttm}) {
    bucketList.add(BucketListItem(
        title: title, content: content, dttm: dttm, alarmDttm: alarmDttm));
    notifyListeners();
  }

  updateItem({
    required int index,
    required String title,
    required String content,
    required String dttm,
    required String alarmDttm,
  }) {
    bucketList[index].content = content;
    bucketList[index].title = title;
    bucketList[index].dttm = dttm;
    bucketList[index].alarmDttm = alarmDttm;
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
