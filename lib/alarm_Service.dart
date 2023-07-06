import 'package:flutter/material.dart';
import 'package:flutter_application_1/alarm.dart';

// 알림 Data 관리
class AlarmService extends ChangeNotifier {
  List<Alarm> alarmList = [];

  addAlarmItem({
    required String year,
    required String month,
    required String day,
    required String hour,
    required String min,
  }) {
    alarmList
        .add(Alarm(year: year, month: month, day: day, hour: hour, min: min));
    notifyListeners();
  }

  updateAlarmItem({
    required int index,
    required String year,
    required String month,
    required String day,
    required String hour,
    required String min,
  }) {
    alarmList[index].year = year;
    alarmList[index].month = month;
    alarmList[index].day = day;
    alarmList[index].hour = hour;
    alarmList[index].min = min;
    notifyListeners();
  }

  removeAlarmItem({required index}) {
    alarmList.remove(index);
    notifyListeners();
  }
}
