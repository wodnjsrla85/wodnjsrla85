/*
  authos : 김재원
  Date      : 2025.04.03 ~ 2025.04.09
  Project   : ToDo List Application
  Vesion : Beta

  Description :
    일정 관리 앱으로, 사용자가 할 일을 추가하고,
    카테고리로 분류하며, 날짜 및 즐겨찾기를 통해 손쉽게 필터링할 수 있습니다.

  pages :    
    - 날짜별 계획 확인 페이지
    - 모든 계획 확인 페이지
    - 즐겨찾기 페이지 (북마크 기능)
    - 설정 페이지

    - 계획 추가 페이지 
    - 계획 수정 페이지

  Features  :
    - 할 일 카드 UI 및 카테고리별 묶음
    - 멀티 선택 및 일괄 삭제 기능
    - 로그인 페이지
    - 카테고리 아이콘/이름/색상 설정 및 선택 기능
    - 북마크 및 날짜 필터 기능

  Note :
    - DB 미사용, 상태 기반 데이터 관리
*/
import 'package:flutter/material.dart';
import 'package:to_do_aplication/home.dart';
import 'package:to_do_aplication/login_page.dart';
import 'package:to_do_aplication/model/color_pallete.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorPallete.mainColor),
      ),

      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/1' : (context) => Home(),
      },
    );
  }
}
