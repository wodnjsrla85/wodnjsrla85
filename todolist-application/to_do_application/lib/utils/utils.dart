import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/message.dart';
import 'package:to_do_aplication/model/todo.dart';

//공통 기능들을 만들어논 class

class Utils {

  // isDoit이 true인 항목을 리스트 하단으로 정렬하는 함수
  static sortAlignTodos(List<ToDo> todoList) {
    todoList.sort((a, b) {
      //Sort가 a,b를 비교해서 순서를 정하는거다.
      if (a.isDoit == true && b.isDoit == false) {
        // a의 값이 true이고 b값이 false 이면 return 1을해서 b를 앞으로 보내는거
        return 1;
      } else if (!a.isDoit == false && b.isDoit == true) {
        // a의 값이 false이고 b값이 true 이면 return -1을해서 b를 뒤로 보내는거
        return -1;
      } else {
        // 둘다 false이거나 true이면 그대로 둬라
        return 0;
      }
    });
  }

  // CheckBox가 체크되어있는 플랜에 todo.isDoit값을 true로 보여주는거
  static doitCheckedTodos(List<ToDo> todoList) {
    // 받은 리스트들의 데이터를 포문으로 체크해서 체크박스가 true고 doit이 false이면
    // 그 플랜의 리스트 값들을변경시켜주는 함수이다.
    for (ToDo todo in todoList) {
      if (todo.isChecked && todo.isDoit == false) {
        todo.isDoit = true;
        todo.isChecked = false;
      } else if (todo.isChecked && todo.isDoit == true) {
        todo.isDoit = false;
        todo.isChecked = false;
      }
    }
  }


  //해당 플랜을 지우는거
  static removeCheckedTodos(List<ToDo> originalList, List<ToDo> todayList) {
  List<ToDo> toRemove = todayList.where((todo) => todo.isChecked).toList();
  originalList.removeWhere((todo) => toRemove.contains(todo));
  //원본에서 toremove에 들어있는 지워야하는 값들을 지워버리는내용
  //todo의 값이 toRemove에 있는지 확인하는 함수 contains
  }

  //플랜 생성시 addPage에서 받은 데이터를 플랜에 추가하는 하수
  static addData(List<ToDo> todoList) {
    if (Message.actions == true) {
      //본문에 바로 넣어버리는 역할
      todoList.add(
        ToDo(
          id: Message.id,
          ownerId: Message.ownerId,
          title: Message.title,
          comment: Message.comment,
          categoryId: Message.categoryId,
          date: Message.date,
        ),
      );
      // actions값을 false로 반영해서 그냥 추가 눌렀다가 pop했을때 생성되는 문제를 해결
      Message.actions = false;
    }
  }

  // Dialog 함수
  static showAlertDialog({
    required BuildContext context, 
    required String title, 
    required String comment, 
    required Function func, // 'OK' 버튼을 눌렀을때의 기능을 함수로 받는다.
  }){
    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          backgroundColor: ColorPallete.mainColor,
          title: Text(title, style: TextStyle(color: ColorPallete.textMainColor, fontWeight: FontWeight.w700, fontFamily: 'Pretendard'),),
          content: Text(comment, style: TextStyle(color: ColorPallete.textMainColor, fontFamily: 'Pretendard'),),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context), 
              child: Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                func(); //함수 실행
                Navigator.pop(context);
              } , 
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  // SnackBar를 띄우는 함수
  static showSnackBar({
    required BuildContext context,
    required String msg, //보낼 메세지 받기
  }){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(msg, style: TextStyle(color: Colors.white, fontFamily: 'Pretendard'),),
        duration: Duration(seconds: 1),
      ),
    );
  }
}
