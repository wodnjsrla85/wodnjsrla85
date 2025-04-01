import 'package:flutter/material.dart';
import 'package:tabbar_app/view/firstpage.dart';
import 'package:tabbar_app/view/secondpage.dart';
//TabBar구성
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  //탭바를 사용하기위해 상속을 받아야한다 with을 사용해서 같이 상속 받는다.
  //Property
  late TabController controller; //TabBar 컨트롤러

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    //Tabbar 생성자
    //length tab 개수 vsync어디다 연결 시킬 건가 this가 home()을 나타낸다 사용하기 위해서 상속이 필요하다.
    //계속 tabbar를 가지고 가야하기때문에 페이지들 위에 home.dart를 띄우는 형태이다.
  }

  //provider로 만들었기 때문에 위에 생성대기때문에 두개가 다르기 때문에 앱이 죽으면 home.dart도 죽어야 한다.
  @override
  void dispose() {
    //앱이 죽을때 사용하는거다.
    controller.dispose();
    //super.dispose가 앱을 종료하는거기때문에 앱을 종료시키기 전에 tabbar를 종료시켜야 한다
    //controller를 죽이면 tabbar가 죽는다.
    super.dispose();
  }

  //@ovverride 라는 건 상건 Statefulwidget에서 상속받은걸 재정의 한거다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar를 2개를 사용하기 싫으면 Home의 AppBar를 지워야하고 하나만 사용하고 싶으면 page들의 appBar를 막아야 한다.
      //appBar: AppBar(title: Text('Tab Bar Test')), 페이지마다 앱바를 다르게 하기 위해서 주석처리
      body: TabBarView(
        controller: controller, //TabBarView의 Controller지정
        children: [FirstPage(), SecondPage()],
        //화면을 띄우는 거다 contrller를 2개 사용하기때문에 첫번째는 FirstPage, 두번째는 SecondPage로 지정
        //바꾸는 건 Scaffold가 알고 있다.
      ),

      //TabBar도 controller가 필요하다 <- 변하는걸 대신 해준다.
      //body가 첫번째를 뛰어줘야 한다.
      bottomNavigationBar: Container(
        color: Colors.black,
        height: 80,
        //color를 주고 싶은데 없을때 사용하는게 container 
        //크기도 지정 가능
        child: TabBar(
          //tab의 navigation 지정
          labelColor: Colors.yellow, //선택된 tab의 색상 
          unselectedLabelColor: Colors.white, //선택되지 않은 tab의 색상
          indicatorColor: Colors.yellow, //하단에 선택된 tab을 표시 해주는거의 색상
          indicatorWeight: 5, //인디케이터의 굵기
          controller: controller, //tabbarview와 같은 controller를 사용
          tabs: [ //tab들을 꾸미는 곳
            Tab(icon: Icon(Icons.looks_one),text: 'one',),
            Tab(icon: Icon(Icons.looks_two),text: 'two',),
          ],
        ),
      ),
    );
  }
}
