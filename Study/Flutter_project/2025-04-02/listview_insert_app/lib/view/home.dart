import 'package:flutter/material.dart';
import 'package:listview_insert_app/view/addlist.dart';
import 'package:listview_insert_app/view/listview.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listview Test'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [AnimalScreen(),AddList()]
      ),

      bottomNavigationBar: Container(
        color: Colors.amber,
        height: 80,

        child: TabBar(
          labelColor: Colors.blue,
          unselectedLabelColor: Colors.red,
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.looks_one),),
            Tab(icon: Icon(Icons.looks_two),)
          ]
        ),
      ),
    );
  }
}