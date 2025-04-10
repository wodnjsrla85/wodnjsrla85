import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';

class FixPlan extends StatefulWidget {
  final ToDo indexPlan; //고치고자 하는 플랜만 가지고 온다 
  final List<CategoryType> categoryType; //카테고리 셀렉터에서 선택할 카테고리 값들
  
  const FixPlan({
    super.key,
    required this.indexPlan,
    required this.categoryType,
  });

  @override
  State<FixPlan> createState() => _FixPlanState();
}

class _FixPlanState extends State<FixPlan> {
  //Property
  late TextEditingController fixTitleController; //title을 고치기 위한 controller
  late TextEditingController fixCommentController; //comment을 고치기 위한 controller

  late DateTime date; //수정할 Date 값을 받을 DateTime형식의 변수
  late bool bookmarkValule; //수정할 bookmark값을 저장할 변수 
  late String category; //수정할 category를 받을 변수

  @override
  void initState() {
    super.initState();

    fixTitleController = TextEditingController();
    fixTitleController.text = widget.indexPlan.title; //text수정전에 기존 title을 보여주기위함

    fixCommentController = TextEditingController();
    fixCommentController.text = widget.indexPlan.comment; //text수정전에 기존 comment를 보여주기 위함

    date = widget.indexPlan.date; //기본값으로 해당 플랜의 Date값을 넣어줌
    bookmarkValule = widget.indexPlan.isBookmarked; //기본 값으로 해당 플랜의 Bool값을 넣어줌
    category = widget.indexPlan.categoryId; //기본 값으로 해당 플랜의 categoryId를 저장
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.mainColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(28, 68, 27, 0),
              child: Row(
                children: [
                  //뒤로 가기 버튼
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(50, 50),
                      padding: EdgeInsets.zero,
                      backgroundColor: ColorPallete.mainColor,
                      foregroundColor: Colors.white,
                      side: BorderSide(
                        color: Colors.white, // 테두리 색
                        width: 1, // 테두리 두께
                      ),
                    ),
                    child: Icon(Icons.arrow_back, size: 20),
                  ),

                  // 해당페이지의 제목
                  Padding(
                    padding: const EdgeInsets.only(left: 67.0),
                    child: Text(
                      'Fix Plan',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Prentedard',
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Container(
                width: 402,
                height: 720,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Colors.white,
                ),

                //고칠 플랜의 제목을 띄워줌
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(28, 28, 28, 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.indexPlan.title,
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          fontSize: 30,
                          color: ColorPallete.mainColor,
                        ),
                      ),

                      //페이지의 기능을 설명
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 16, 0, 21),
                        child: Text(
                          'Fix your Daily plan',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: ColorPallete.unselectedColor,
                          ),
                        ),
                      ),
        
                      //Date Selector & Category Selector
                      Row(
                        children: [
                          SizedBox(
                            width: 266,
                            height: 40,
        
                            //Date Selector
                            child: ElevatedButton(
                              onPressed: () async {
                                final DateTime? picked = await showDatePicker(
                                context: context,
                                firstDate: DateTime(2021),
                                lastDate: DateTime(2028),
                              );
        
                              if (picked != null && picked != date) {
                              date = picked;
                              setState(() {});
                              }
                              
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.mainColor,
                                foregroundColor: ColorPallete.textMainColor,
                              ),
                              child: Row(
                                children: [
                                  Text('${date.month}/${date.day}'),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 165.0),
                                    child: Icon(Icons.date_range, size: 22),
                                  ),
                                ],
                              ),
                            ),
                          ),
        
                          //Category Selector
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SizedBox(
                              width: 60,
                              height: 40,
                              child: ElevatedButton(
                                onPressed: () {

                                  //카테고리 선택창 띄움
                                  showCategorySelector(
                                    context: context,
                                    categoryList: widget.categoryType,
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: ColorPallete.addEmoticonButton,
                                  foregroundColor: Colors.white,
                                ),
                                child: Icon(Icons.emoji_emotions, size: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
        
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 25, 0, 25),
                        child: SizedBox(
                          width: 346,
                          height: 40,

                          //제목 입력창
                          child: TextField(
                            controller: fixTitleController,
                            maxLines: 1,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: ColorPallete.textfieldColor,
                              label: Text(widget.indexPlan.title),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
        
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30.0),
                        child: Container(
                          //comment textfield의 크기 조절
                          height: 300,
                          decoration: BoxDecoration(
                            color: ColorPallete.textfieldColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: TextField(
                            //comment textfield
                            controller: fixCommentController,
                            textInputAction: TextInputAction.done,
                            maxLines: null,
                            decoration: InputDecoration(
                              label: Text(widget.indexPlan.comment),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                      ),
        
                      //하단 버튼들
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 29.0),
                            child:
                            //BookMark Button
                            TextButton(
                              onPressed: () {
                                bookmarkValule == false
                                    ? bookmarkValule = true
                                    : bookmarkValule = false;
        
                                setState(() {});
                              },
                              child: Text(
                                'BookMark',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      bookmarkValule == false
                                          ? ColorPallete.addEmoticonButton
                                          : ColorPallete.mainColor,
                                      //bookmark 값에 따른 변화를 사용자에게 전달
                                ),
                              ),
                            ),
                          ),
        
                          SizedBox(
                            width: 200,
                            height: 60,
                            child: ElevatedButton(
                              onPressed: () {
                                fixPlan();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorPallete.mainColor,
                                foregroundColor: ColorPallete.textMainColor,
                              ),
                              child: Text(
                                'Change',
                                style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //해당 플랜에 고친 데이터 값을 넣어주는 함수
  fixPlan() {
    widget.indexPlan.title = fixTitleController.text;
    widget.indexPlan.comment = fixCommentController.text;
    widget.indexPlan.date = date;
    widget.indexPlan.categoryId = category;
    widget.indexPlan.isBookmarked = bookmarkValule;

    setState(() {});
  }


  //카테고리를 띄우고 categoryId값을 저장 시켜주는 함수
  showCategorySelector({
    required BuildContext context, // 바텀 시트를 띄우기 위한 context
    required List<CategoryType> categoryList,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children:
              categoryList.map((categorySelect) {
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(categorySelect.icon),
                      ),
                      Text(categorySelect.name),
                    ],
                  ),
                  onTap: () {
                    category = categorySelect.id;
                    setState(() {});
                    Navigator.pop(context);
                  },
                );
              }).toList(),
        );
      },
    );
  }
}
