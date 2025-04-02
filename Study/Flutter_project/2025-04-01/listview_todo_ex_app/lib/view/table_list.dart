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
              child: Dismissible(
                //옆으로 밀면 삭제하는 기능
                direction: DismissDirection.endToStart,
                //어느 쪽으로 밀 건가
                key: ValueKey(todoList[index]),
                //해당 데이터를 가지고 오는거 
                onDismissed: (direction) {
                //delete를 누르면 발생시킬 명령어 데이터를 지우기
                todoList.remove(todoList[index]);
                //remove at은 뒤에 인덱스를 없에는 것
                setState(() {});
                },
                background: Container(
                  //백그라운드 안에 다 넣어주기 위해 container 사용
                  color: Colors.red,
                  alignment: Alignment.centerRight, 
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(Icons.delete_forever, size: 50,), 
                  //symmetric 좌우 대칭 
                  //컨테이너 정렬 alignment center 는 땡기게 되면 계속 가운데고 centerrigt를 사용해서 밀어도 오른쪽에 있게 해야한다.
                ),
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