import 'package:to_do_aplication/model/account.dart';

class Message {
  static String id = '';
  static String ownerId = Account.id;        // 작성자 ID
  static String title = '';
  static String comment = '';
  static String categoryId = '';     // 연결된 카테고리
  static DateTime date = DateTime.now();         // 날짜 + 시간
  static bool isBookmarked = false;
  static bool isChecked = false;
  static bool isDoit = false;
  static bool actions = false;

  //추가할때 받아야하는 값들
  /*
    Message.id = ,
    Message.date = ,
    Message.categoryId = ,
    Message.title = titleController.text,
    Message.comment = commentController.text,
    Message.isBookmarked =,
  */
}