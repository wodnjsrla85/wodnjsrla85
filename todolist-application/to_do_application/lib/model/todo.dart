class ToDo {
  String id;
  String ownerId;        // 작성자 ID
  String title;
  String comment;
  String categoryId;     // 연결된 카테고리
  DateTime date;         // 날짜 + 시간
  bool isBookmarked;
  bool isChecked;
  bool isDoit;

  ToDo({
    required this.id,
    required this.ownerId,
    required this.title,
    required this.comment,
    required this.categoryId,
    required this.date,
    this.isBookmarked = false,
    this.isChecked = false,
    this.isDoit = false,
  });
  
}