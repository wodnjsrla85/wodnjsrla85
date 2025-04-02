import 'package:flutter/material.dart';
import 'package:listview_app_tc/model/animal_list.dart';
import 'package:listview_app_tc/view/first_page.dart';
import 'package:listview_app_tc/view/second_page.dart';
//탭바와 데이터를 작성

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //tabcontroller사용하기위해 하나더 상속
  //property
  late TabController controller; //탭바 컨트롤러
  late List<Animal> animalList; //listview로 사용할 리스트

  //데이터를 home에 설정
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  addList(){
    animalList.add(Animal(imagePath: 'images/bee.png', animalName: '벌', kind: '파충류', flyExist: true));
    animalList.add(Animal(imagePath: 'images/cat.png', animalName: '고양이', kind: '포유류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/cow.png', animalName: '젖소', kind: '포유류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/dog.png', animalName: '강아지', kind: '포유류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/fox.png', animalName: '여우', kind: '포유류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/monkey.png', animalName: '원숭이', kind: '영장류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/pig.png', animalName: '돼지', kind: '포유류', flyExist: false));
    animalList.add(Animal(imagePath: 'images/wolf.png', animalName: '늑대', kind: '포유류', flyExist: false));
  
  }

  //탭바 dispose
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('동물친구찾기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          //list 를 넘겨줘야 한다. 데이터 연결
          FirstPage(list: animalList,),
          SecondPage(list: animalList,),
        ],
      ),
      bottomNavigationBar: TabBar(
        controller: controller,
        tabs: [
          Tab(
            icon: Icon(Icons.looks_one),
          ),
          Tab(
            icon: Icon(Icons.looks_two),
          ),
        ]
      ),
    );
  }
}