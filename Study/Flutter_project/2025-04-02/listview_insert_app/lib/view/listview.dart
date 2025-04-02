import 'package:flutter/material.dart';
import 'package:listview_insert_app/model/list_view.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({super.key});

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  late List<AnimalList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addList();
  }

  addList() {
    todoList.add(
      AnimalList(animalImage: 'images/bee.png', comment: '벌', message: '벌'),
    );
    todoList.add(
      AnimalList(animalImage: 'images/cat.png', comment: '고양이', message: '벌'),
    );
    todoList.add(
      AnimalList(animalImage: 'images/cow.png', comment: '소', message: '벌'),
    );
    todoList.add(
      AnimalList(animalImage: 'images/dog.png', comment: '개', message: '벌'),
    );
    todoList.add(
      AnimalList(animalImage: 'images/fox.png', comment: '여우', message: '벌'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            return SizedBox(
              height: 80,
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('동물 추가하기'),
                        content: Text(
                          '이동물은입니다. 또 동물의 종류는 파충류 입니다.\n 이동물은 날 수 있습니다.\n 이 동물을 추가하시겠습니까?',
                        ),
                        actions: [
                          TextButton(
                            onPressed:  () {
                              Navigator.pop(context);
                            }, 
                            child: Text('닫기')
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(todoList[index].animalImage),
                      Text(todoList[index].comment),
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
}
