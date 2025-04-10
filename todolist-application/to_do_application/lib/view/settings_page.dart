import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/account.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/utils/utils.dart';

class SettingsPage extends StatefulWidget {
  final List<ToDo> list; //데이터 초기화시 초기화시킬 플랜 데이터
  const SettingsPage({super.key, required this.list});

  @override
  State<SettingsPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  late TextEditingController newIdController; //새로운 id를 받을 controller
  late TextEditingController newPwController; //새로운 pw를 받을 controller

  @override
  void initState() {
    super.initState();

    newIdController = TextEditingController();
    newPwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.mainColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 402,
          height: 810,
          decoration: BoxDecoration(
            color: ColorPallete.textMainColor,
            borderRadius: BorderRadius.circular(30),
          ),

          child: Padding(
            padding: const EdgeInsets.fromLTRB(28, 67, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //page 제목
                Text(
                  'Setting',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: ColorPallete.mainColor,
                  ),
                ),

                //제목과 기능을 시각적으로 나눠주는 divider
                SizedBox(
                  width: 178,
                  child: Divider(thickness: 3, color: ColorPallete.mainColor),
                ),

                //계정 관련 항목들
                //주제목
                Text(
                  'account',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 30,
                    fontWeight: FontWeight.w300,
                    color: ColorPallete.mainColor,
                  ),
                ),

                //부제목
                Text(
                  'Change User ID',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: ColorPallete.mainColor,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: 346,
                    height: 50,
                    //먼저 기존 id를 알려주는 textfield
                    child: TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          size: 20,
                          color: ColorPallete.unselectedColor,
                        ),
                        labelText: Account.id, //기존 id를 가지고옴
                        labelStyle: TextStyle(fontFamily: 'Pretendard'),
                        filled: true,
                        fillColor: ColorPallete.textfieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                //새로운 id를 받는 곳
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 346,
                    height: 50,
                    child: TextField(
                      controller: newIdController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          size: 20,
                          color: ColorPallete.unselectedColor,
                        ),
                        labelText: 'NEW ID',
                        labelStyle: TextStyle(fontFamily: 'Pretendard'),
                        filled: true,
                        fillColor: ColorPallete.textfieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                //부제목
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Change User PW',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: ColorPallete.mainColor,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: 346,
                    height: 50,
                    child: TextField(
                      //기존 비밀번호를 보여주는 textfiled
                      readOnly: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          size: 20,
                          color: ColorPallete.unselectedColor,
                        ),
                        labelText: Account.pw, //기존 비밀번호를 보여줌
                        labelStyle: TextStyle(fontFamily: 'Pretendard'),
                        filled: true,
                        fillColor: ColorPallete.textfieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                //새 비밀번호를 받는곳
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: SizedBox(
                    width: 346,
                    height: 50,
                    child: TextField(
                      controller: newPwController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.account_circle_outlined,
                          size: 20,
                          color: ColorPallete.unselectedColor,
                        ),
                        labelText: 'NEW PW',
                        labelStyle: TextStyle(fontFamily: 'Pretendard'),
                        filled: true,
                        fillColor: ColorPallete.textfieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                //데이터 초기화 제목
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Text(
                    'Reset Data',
                    style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: ColorPallete.mainColor,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SizedBox(
                    width: 346,
                    height: 50,
                    child: ElevatedButton(
                      //데이터 초기화 버튼
                      onPressed: () {
                        //사용자의 실수 방지용 dialog
                        Utils.showAlertDialog(
                          context: context,
                          title: '데이터 초기화',
                          comment: '모든 데이터가 초기화 됩니다.',
                          func: () {
                            widget.list.clear();
                            setState(() {});
                          },
                          //초기화 명령문 widget.list.clear로 전체 데이터 초기화
                        );

                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: ColorPallete.textMainColor,
                        backgroundColor: ColorPallete.mainColor,
                      ),
                      child: Text(
                        'Reset Data',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 21,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //ID/PW 변경 하는 버튼
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 18),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          backgroundColor: ColorPallete.mainColor,
          foregroundColor: ColorPallete.textMainColor,
          onPressed: () {
            if (newIdController.text.trim().isEmpty ||
                newPwController.text.trim().isEmpty) {
              Utils.showSnackBar(
                context: context,
                msg: 'New Id/Pw에 공백이 존재합니다.',
              );
            } else {
              Utils.showAlertDialog(
                context: context,
                title: 'ID/PW변경',
                comment: 'ID/PW를 변경하시겠습니까?',
                func: () {
                  changeAccount(); //저장
                  Navigator.pop(context); //다이어로그 끄기

                  Future.delayed(Duration(milliseconds: 100), () {
                    //꺼진후 몇초뒤 다시 로그인 페이지로 이동
                    Navigator.pushNamed(context,'/',); }
                  );
                },
              );
              setState(() {});
            }
          },
          child: Icon(Icons.check, size: 30),
        ),
      ),
    );
  }

  changeAccount() {
    Account.id = newIdController.text;
    Account.pw = newPwController.text;

    setState(() {});
  }
}
