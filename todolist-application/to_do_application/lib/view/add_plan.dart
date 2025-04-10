import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/message.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/utils/utils.dart';

class AddPlan extends StatefulWidget {
  final List<CategoryType> categoryList; //원본 카테고리 정보
  final List<ToDo> todoList; //원본 plan들

  const AddPlan({super.key, required this.categoryList, required this.todoList});

  @override
  State<AddPlan> createState() => _AddPlanState();
}

class _AddPlanState extends State<AddPlan> {
  late TextEditingController titleController; //Title
  late TextEditingController commentController; //Comment

  late String id; //Plan에 들어있는 id(고유 넘버)
  DateTime dateTime = DateTime.now(); //생성 날짜
  late String categoryPath; //어떤 카테고린지 표현
  late bool bookmarkValue; //bookmark 유무

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    commentController = TextEditingController();
    bookmarkValue = false; //사용자가 선택하기 전에는 미선택
    categoryPath = widget.categoryList[0].id; //선택안할시 카테고리는 Drink
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.mainColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 402,
              height: 736,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: ColorPallete.textMainColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 68, 28, 28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // 뒤로 가기 버튼
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(50, 50),
                        padding: EdgeInsets.zero,
                        backgroundColor: ColorPallete.textfieldColor,
                        foregroundColor: ColorPallete.unselectedColor,
                      ),
                      child: Icon(Icons.arrow_back, size: 20),
                    ),
        
                    // 이 페이지가 무엇을 하는지 나타내 준다.
                    Padding(
                      padding: const EdgeInsets.only(top: 28.0),
                      child: Text(
                        'Create Plan',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: ColorPallete.mainColor,
                        ),
                      ),
                    ),
        
                    // 이 페이지에서 할 수 있는 역할 설명
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                      child: Text(
                        "make your Today's new plan",
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
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
        
                              if (picked != null && picked != dateTime) {
                                dateTime = picked;
                                setState(() {});
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorPallete.mainColor,
                              foregroundColor: ColorPallete.textMainColor,
                            ),
                            child: Row(
                              children: [
                                Text(
                                  dateTime.day == DateTime.now().day
                                      ? 'Today'
                                      : '${dateTime.month}/${dateTime.day}',
                                  style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 150.0),
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
                                showCategorySelector(
                                  context: context,
                                  categoryList: widget.categoryList,
                                );
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: ColorPallete.addEmoticonButton,
                                foregroundColor: ColorPallete.textMainColor,
                              ),
                              child: Icon(Icons.emoji_emotions, size: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
        
                    // New Plan Title TextField
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 20),
                      child: SizedBox(
                        width: 346,
                        height: 40,
                        child: TextField(
                          controller: titleController,
                          maxLines: 1,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: ColorPallete.textfieldColor,
                            label: Text('Title'),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                    ),
        
                    //New TextComment TextField
                    Container(
                      height: 300,
                      decoration: BoxDecoration(
                        color: ColorPallete.textfieldColor,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: TextField(
                        controller: commentController,
                        textInputAction: TextInputAction.done,
                        maxLines: null,
                        decoration: InputDecoration(
                          label: Text('Comment'),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 41, 0, 37),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 39.0),
                    child:
                    //BookMark Button
                    TextButton(
                      onPressed: () {
                        //누를시 bool값을 바꿔준다.
                        bookmarkValue == false
                        ? bookmarkValue = true
                        : bookmarkValue = false;
                        setState(() {});
                      },
                      child: Text(
                        'BookMark',
                        style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: bookmarkValue == false
                          ? ColorPallete.addEmoticonButton
                          : ColorPallete.textMainColor,
                          // bool값 전환시 사용자에게 알려주는 용도
                        ),
                      ),
                    ),
                  ),
        
                  // CreateButton
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        // 공백 학인 
                        if(titleController.text.trim().isEmpty || commentController.text.trim().isEmpty){
                          Utils.showSnackBar(context: context, msg: 'Title/Comment에 공백이 존재합니다.');
                        }else{
                          //공백없으면 데이터 저장소에 데이터를 넘겨준다
                          addPlan();
                          setState(() {});
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorPallete.textMainColor,
                        foregroundColor: ColorPallete.mainColor,
                      ),
                      child: Text(
                        'Create',
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
            ),
          ],
        ),
      ),
    );
  }

  // 생성되는 데이터를 Message.id에 넣어주는 함수
  addPlan() {
      Message.id = (widget.todoList.length + 1).toString(); 
      Message.date = dateTime;
      Message.categoryId = categoryPath;
      Message.title = titleController.text;
      Message.comment = commentController.text;
      Message.isBookmarked = bookmarkValue;
      Message.actions = true;
  }

  //카테고리 리스트를 띄워주는 함수
  showCategorySelector({
    required BuildContext context, // 바텀 시트를 띄우기 위한 context
    required List<CategoryType> categoryList,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView( //리스트에 값들을 모두 띄워줘야 하기때문에 ListView이용
          children:
              //카테고리의 값을 map으로 전환시킨다음에 원하는 데이터를 표현시
              categoryList.map((category) {
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(category.icon),
                      ),
                      Text(category.name),
                    ],
                  ),
                  onTap: () {
                    categoryPath = category.id;
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
