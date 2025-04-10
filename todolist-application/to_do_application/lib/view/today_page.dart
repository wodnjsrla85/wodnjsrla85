import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/utils/utils.dart';
import 'package:to_do_aplication/view/add_plan.dart';
import 'package:to_do_aplication/view/fix_plan.dart';

//TodayPage로 올때 필수로 받아올 정보들 홈에 tabbar가 있기 때문에 홈에서 넘겨줘야한다.
class TodayPage extends StatefulWidget {
  final List<ToDo> todoList; //Home에서 정의한 기본 정의한 todoList
  final List<CategoryType> categoryList; //Home에서 정의한 CategoryList

  const TodayPage({ 
    //홈에서 정의한 리스트들을 무조건 적으로 받아야한다.
    super.key,
    required this.todoList, 
    required this.categoryList,
  });

  @override
  State<TodayPage> createState() => _TodayPageState();
}

class _TodayPageState extends State<TodayPage> {
  late List<ToDo> dateTodos; //해당 날짜에 맞는 데이터만 빼서 넣을 list 변수
  late DateTime selectedDate; // 캘린더에서 선택된 날짜 저장

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now(); //일단 첫 화면에서 당일 데이터만 보이게 하기위해서 now

    filterDate(); //당일 데이터만 리스트에 넣는 함수
  }
  
  //당일 데이터만 뽑는 함수
  filterDate(){
    dateTodos = widget.todoList.where((date) {
      return 
      date.date.year == selectedDate.year &&
      date.date.month == selectedDate.month &&
      date.date.day == selectedDate.day;
    },).toList();

    //데이터들의 isDoit값을 체크해서 true인 값들을 밑으로 내려주는 함수
    Utils.sortAlignTodos(dateTodos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.mainColor,
      body: Container(
        width: 402,
        height: 810,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: ColorPallete.textMainColor,
        ),

        // 기본 범위 설정
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 0, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 화면의 제목
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 67, 0, 0),
                child: Text(
                  'Plan',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: ColorPallete.mainColor,
                  ),
                ),
              ),

              // 제목과 기능적인 부분을 나눠주는 선
              SizedBox(
                width: 149,
                child: Divider(thickness: 3, color: ColorPallete.mainColor),
              ),

              // 기능 버튼들의 모음
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 35),
                child: Row(
                  children: [
                    
                    // 날짜 변경 버튼
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () async {
                          //캘린더에서 선택한 DateTime을 넣어줄 변수 (null이 가능하게)
                          final DateTime? picked = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2021),
                            lastDate: DateTime(2028),
                          ); //캘린더 띄우기

                          //선택하면 그날짜에 해당하는 플랜들 보여주기
                          if (picked != null && picked != selectedDate) {
                            selectedDate = picked;
                            filterDate();
                            setState(() {});
                          }

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.mainColor,
                        ),
                        
                        // 버튼에 선택날짜 보여주기
                        child: Text(
                          selectedDate.day == DateTime.now().day
                              ? 'Today'
                              : '${selectedDate.month}/${selectedDate.day}',
                              //선택된 날짜의 월/일로 표시
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: ColorPallete.textMainColor,
                          ),
                        ),
                      ),
                    ),

                    // 플랜을 끝냈을때 버튼
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Utils.doitCheckedTodos(dateTodos);
                            //체크박스 확인해서 isDoit값을 바꿔주는 함수

                            Utils.sortAlignTodos(dateTodos);
                            //isDoit값으로 다시 정렬
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: ColorPallete.unselectedTextColor,
                            foregroundColor: ColorPallete.unselectedColor,
                          ),
                          child: Icon(Icons.check, size: 24),
                        ),
                      ),
                    ),

                    //삭제 버튼
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          //삭제시 한번더 확인하는 AlertDialog를 띄움
                          Utils.showAlertDialog(
                              context: context,
                              title: '계획 삭제',
                              comment: '계획을 삭제 하시겠습니까?',
                              func: () {
                                Utils.removeCheckedTodos(
                                  widget.todoList,
                                  dateTodos,
                                );
                                Utils.showSnackBar(context: context,msg: '계획이 삭제되었습니다.');
                                filterDate();
                                setState(() {}); // 삭제 후에 setState
                              },
                            );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: ColorPallete.unselectedTextColor,
                          foregroundColor: ColorPallete.unselectedColor,
                        ),
                        child: Icon(Icons.delete_forever, size: 24),
                      ),
                    ),

                    //카테고리별로 보여주는 버튼
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            //카테고리창 불러주는 함수 실행
                            showCategoryList(categorys: widget.categoryList);
                            Utils.sortAlignTodos(dateTodos);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: ColorPallete.mainColor,
                            foregroundColor: ColorPallete.textMainColor,
                          ),
                          child: Icon(Icons.arrow_drop_down, size: 24),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // main card List
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  //listview builder와 row간의 간격 없애기
                  itemCount: dateTodos.length,
                  itemBuilder: (context, index) {
                    // Index를 이용해 하나의 리스트씩 넣어준다.
                    ToDo today = dateTodos[index];

                    //Category가 어떤건지 알아내서 category에 넣어준다.
                    CategoryType category = widget.categoryList.firstWhere(
                      (category) => category.id == today.categoryId,
                    );
                    
                    return Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: SizedBox(
                        height: 100,
                        child: GestureDetector(
                          onTap: () {

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => 
                              FixPlan(indexPlan: today, categoryType: widget.categoryList,),
                              // 수정 화면으로 이동 
                              )

                            ).then((value) {
                              // 변경점 반영 및 정렬
                              filterDate();
                              setState(() {});
                            },);

                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                16,
                              ), // 원하는 radius 값
                            ),
                            color:

                                // 끝낸 플랜과 아직 못끝낸 플랜들의 구분
                                today.isDoit == true
                                    ? ColorPallete.doitPlanColor
                                    : ColorPallete.textfieldColor,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                // Category에 맞는 Icon
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: Icon(
                                      category.icon,
                                      size: 40,
                                      color: ColorPallete.mainColor,
                                    ),
                                  ),
                                ),
                          
                                // Plan에 맞는 title과 comment
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    //title
                                    SizedBox(
                                      width: 155,
                                      height: 32,
                                      child: Text(
                                        today.title,
                                        style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: ColorPallete.mainColor,
                                        ),
                                      ),
                                    ),
                                    
                                    //coment
                                    SizedBox(
                                      width: 155,
                                      height: 32,
                                      child: Text(
                                        today.comment,
                                        style: TextStyle(
                                          fontFamily: 'Pretendard',
                                          fontSize: 13,
                                          fontWeight: FontWeight.w300,
                                          color: ColorPallete.mainColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                          
                                //나중에 선택 삭제가 가능한 checkbox
                                Checkbox(
                                  checkColor: ColorPallete.textMainColor,
                                  activeColor: ColorPallete.mainColor,
                                  value: today.isChecked,
                                  onChanged: (value) {
                                    today.isChecked = value!;
                                    setState(() {});
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      // 새로운 플랜을 추가하는 곳으로 이동하는 버튼
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 18),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          backgroundColor: ColorPallete.mainColor,
          foregroundColor: ColorPallete.textMainColor,

          onPressed: () {

            //눌렀을때 이동
            Navigator.push(context,MaterialPageRoute(
                builder:(context) => AddPlan(
                      categoryList: widget.categoryList,
                      todoList: widget.todoList,
                    ),
              ),
            ).then((value) {
              // 추가하여 넣은데이터들을(message에 들어있음) 다시 이 화면으로 왔을때 생성시켜주는
              
              Utils.addData(widget.todoList);
              //데이터 추가하고 다시 정렬 시키기
              filterDate();
              setState(() {});
            });
          },
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }

  //카테고리 선택창 띄우고 전체보기를 누르면 전체 플랜 / 선택된 카테고리 플랜만 보이기
  showCategoryList({
    required List<CategoryType> categorys,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
              ListTile(
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Icon(Icons.all_inbox),
                    ),
                    Text('전체 보기'),
                  ],
                ),
                onTap: () {
                  filterDate();
                  setState(() {});
                  Navigator.pop(context);
                },
              ),
              ...categorys.map((id) {
                return ListTile(
                  title: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0),
                        child: Icon(id.icon),
                      ),
                      Text(id.name),
                    ],
                  ),
                  onTap: () {
                    dateTodos =
                        widget.todoList.where((a) {
                          return a.categoryId == id.id
                          && a.date.year == selectedDate.year 
                          && a.date.month == selectedDate.month
                          && a.date.day == selectedDate.day;
                        }).toList();

                    setState(() {});
                    Navigator.pop(context);
                  },
                );
              }),
          ]
        );
      },
    );
  }
}
