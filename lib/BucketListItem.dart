// 버킷리스트 Data
class BucketListItem {
  BucketListItem({
    this.isCompleted = false,
    required this.content,
  });

  String content;
  bool isCompleted;

  Map toJson() {
    return {
      'isCompleted': isCompleted,
      'content': content,
    };
  }

  factory BucketListItem.fromJson(json) {
    return BucketListItem(
        isCompleted: json['isCompleted'], content: json['content']);
  }
}
