import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/button.dart';
import 'package:tabbar_image_ex_app/swipe.dart';
import 'package:tabbar_image_ex_app/time.dart';

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
    controller = TabController(length: 3, vsync: this);
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
        title: Text(
          '이미지 변경하기',
        ),
        centerTitle: true,
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
      ),
      body: TabBarView(
        controller: controller,
        children:[
          Button(),
          Swipe(),
          Time(),
        ]
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 80,
        child: TabBar(
          labelColor: Colors.blue, 
          unselectedLabelColor: Colors.red,
          indicatorColor: Colors.blue,
          indicatorWeight: 5,
          controller: controller,
          tabs: [
            Tab(icon: Icon(Icons.touch_app_outlined),text: 'Button',),
            Tab(icon: Icon(Icons.swipe),text: 'Swipe',),
            Tab(icon: Icon(Icons.timer),text: 'Timer',)
          ],
        ),
      ),
    );
  }
}