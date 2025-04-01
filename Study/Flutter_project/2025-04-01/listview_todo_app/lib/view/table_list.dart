import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList; //만든 모델을 Generic으로 사용

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }
  addData(){//todoList[0][0] -> imagePath값을 가지고 온다. todoList[0][1] -> workList 값을 가지고 온다,
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList.add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
    //생성자를 통해서 데이터들을 넣어줘야 한다.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/insert').then((value) => rebuildData(),); //갔다가 다시 pop되었을때  
            },
            icon: Icon(Icons.add_outlined)
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 100,
              child: GestureDetector(
                onTap: () {
                  //넘어 갈때 글씨를 가지고 가야한다.  class는 교류가 안되는데 교류가 되는 static class를 만들어야한다.
                  Message.workList = todoList[index].workList;
                  Message.imagePath = todoList[index].imagePath;
                  Navigator.pushNamed(context, '/detail'); 
                },
                child: Card(
                  //짝수 일때 홀수일때 다른 색으로 하는방법
                  color: index % 2 ==0
                  ? Colors.amber
                  : Colors.blue,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          todoList[index].imagePath
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10,0,0,0),
                        child: Text(
                          todoList[index].workList,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  rebuildData(){
    if(Message.action == true){
      todoList.add(TodoList(imagePath: Message.imagePath, workList: Message.workList));
      Message.action = false;
    }
    
    setState(() {});
  }
}