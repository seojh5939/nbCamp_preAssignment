/// 알림 데이터
class Alarm {
  Alarm({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.min,
  });
  String year;
  String month;
  String day;
  String hour;
  String min;

  String print() {
    return "$year년$month월$day일 $hour시 $min분";
  }

  String isEmpty() => "";
}
