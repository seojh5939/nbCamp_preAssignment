// 버킷리스트 Data
class BucketListItem {
  BucketListItem({
    this.isCompleted = false,
    this.title = "",
    required this.content,
    this.dttm = "",
  });
  String title;
  String content;
  String dttm;
  bool isCompleted;

  Map toJson() {
    return {
      'isCompleted': isCompleted,
      'title': title,
      'content': content,
      'dttm': dttm,
    };
  }

  factory BucketListItem.fromJson(json) {
    return BucketListItem(
        isCompleted: json['isCompleted'],
        title: json['title'],
        content: json['content'],
        dttm: json['dttm']);
  }
}
