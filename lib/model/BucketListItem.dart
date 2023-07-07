// 버킷리스트 Data
// ignore_for_file: prefer_initializing_formals

import 'package:flutter_application_1/model/alarm.dart';

class BucketListItem {
  BucketListItem(
      {this.isCompleted = false,
      required this.title,
      required this.content,
      required this.dttm,
      required this.alarmDttm});
  bool isCompleted;
  String title;
  String content;
  String dttm;
  String alarmDttm;

  Map toJson() {
    return {
      'isCompleted': isCompleted,
      'title': title,
      'content': content,
      'dttm': dttm,
      'alarmDttm': alarmDttm,
    };
  }

  factory BucketListItem.fromJson(json) {
    return BucketListItem(
      isCompleted: json['isCompleted'],
      title: json['title'],
      content: json['content'],
      dttm: json['dttm'],
      alarmDttm: json['alarmDttm'],
    );
  }
}
