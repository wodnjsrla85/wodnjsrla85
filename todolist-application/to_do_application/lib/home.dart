import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/account.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/view/all_plan.dart';
import 'package:to_do_aplication/view/bookmark_page.dart';
import 'package:to_do_aplication/view/settings_page.dart';
import 'package:to_do_aplication/view/today_page.dart';

//TabBar

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{
  //Property 
  late TabController controller; // Tabbar controller

  late List<ToDo> todoList;
  late List<CategoryType> categoryList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 4, vsync: this);

    categoryList = [
      CategoryType(id: 'Drink', name: 'Drink', icon: Icons.local_drink, color: ColorPallete.mainColor, ownerId: Account.id),
      CategoryType(id: 'Study', name: 'Study', icon: Icons.draw_sharp, color: ColorPallete.mainColor, ownerId: Account.id),
      CategoryType(id: 'Promise', name: 'Promise', icon: Icons.hourglass_bottom_rounded, color: ColorPallete.mainColor, ownerId: Account.id),
      CategoryType(id: 'Exercise', name: 'Exercise', icon: Icons.sports_gymnastics, color: ColorPallete.mainColor, ownerId: Account.id),
      CategoryType(id: 'Schedule', name: 'Schedule', icon: Icons.schedule, color: ColorPallete.mainColor, ownerId: Account.id),
    ];

    todoList = [
      ToDo(
        id: 'todo1', 
        ownerId: Account.id, 
        title: '물 마시기', 
        comment: '물 1L마시기', 
        categoryId: categoryList[0].id, 
        date: DateTime.now(),
        isDoit: false,
      ),
      ToDo(
        id: 'todo2', 
        ownerId: Account.id, 
        title: '공부하기', 
        comment: '영어 공부하기', 
        categoryId: categoryList[1].id, 
        date: DateTime(2025,04,06),
        isDoit: false,
      ),
      ToDo(
        id: 'todo3', 
        ownerId: Account.id, 
        title: '공부하기', 
        comment: '영어 공부하기', 
        categoryId: categoryList[1].id, 
        date: DateTime.now(),
        isDoit: false,
      ),
      ToDo(
        id: 'todo4', 
        ownerId: Account.id, 
        title: '운동하기', 
        comment: '6시 헬스장가기', 
        categoryId: categoryList[3].id, 
        date: DateTime.now(),
        isDoit: false,
      ),
      ToDo(
        id: 'todo5', 
        ownerId: Account.id, 
        title: 'ADSP시험', 
        comment: '시험 시작 10:00', 
        categoryId: categoryList[4].id, 
        date: DateTime.now(),
        isDoit: false,
      ),
    ];
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: controller,
        children: [
          TodayPage(
            todoList: todoList, 
            categoryList: categoryList,
          ),
          AllPlan(
            toDoList: todoList,
            categoryList: categoryList,
          ),
          BookmarkPage(
            toDoList: todoList,
            categoryList: categoryList,
          ),
          SettingsPage(
            list: todoList,
          ),
        ],
      ),
      
      bottomNavigationBar: Container(
        color: ColorPallete.mainColor,
        height: 64,
        child: TabBar(
          controller: controller,
          labelColor: ColorPallete.textMainColor,
          unselectedLabelColor: ColorPallete.unselectedColor,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(icon: Icon(Icons.home_filled,size: 30,),),
            Tab(icon: Icon(Icons.insert_chart_rounded, size: 30,),),
            Tab(icon: Icon(Icons.bookmarks_rounded,size: 28,),),
            Tab(icon: Icon(Icons.settings,size: 30,),),
          ]
        ),
      ),
    );
  }
}