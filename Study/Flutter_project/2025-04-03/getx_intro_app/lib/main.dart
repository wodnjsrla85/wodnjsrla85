import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
//Get기능을 사용할 수 있게 해준다.
import 'package:getx_intro_app/home.dart';
import 'package:getx_intro_app/third_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //get사용을 위해 GetMaterialApp으로 사용
      title: 'Flutter Demo',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        //pubspec.yaml에 작성
      ],//언어 설정 권한을 주는거 
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Home(),
      //get route사용시 home사용
      //get route설정
      getPages: [
        GetPage(
          name: '/third', 
          page:() => ThirdPage(),
        ),
        GetPage(
          name: '/third2', 
          page: () => ThirdPage(),
          transition: Transition.circularReveal,
          transitionDuration: Duration(seconds:3)
        ),//같은페이지에 이름을 틀리게하면 이동효과를 다르게 줄 수 있다.
      ],

    );
  }
}

