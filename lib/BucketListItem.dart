// 버킷리스트 Data
class BucketListItem {
  BucketListItem({
    this.isCompleted = false,
    required this.content,
  });

  String content;
  bool isCompleted;
}
