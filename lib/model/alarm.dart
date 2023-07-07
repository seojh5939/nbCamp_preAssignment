/// 알림 데이터
class Alarm {
  Alarm({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.min,
  });
  int year;
  int month;
  int day;
  int hour;
  int min;

  @override
  String toString() {
    return "$year년$month월$day일 $hour시 $min분";
  }

  String isEmpty() => "";
}
