import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/utils/utils.dart';
import 'package:to_do_aplication/view/add_plan.dart';
import 'package:to_do_aplication/view/fix_plan.dart';

class AllPlan extends StatefulWidget {
  final List<ToDo> toDoList; //원본 플랜들
  final List<CategoryType> categoryList; //카테고리 선택을 위한 정보 제공 

  const AllPlan({
    super.key,
    required this.toDoList,
    required this.categoryList,
  });

  @override
  State<AllPlan> createState() => _AllPlanState();
}

class _AllPlanState extends State<AllPlan> {
  late List<ToDo> allList; //모든 플랜을 닮을 플랜

  @override
  void initState() {
    super.initState();
    allList = widget.toDoList; //원본 플랜에 모든 플랜들이 들어있기때문에 초기값 저장

    Utils.sortAlignTodos(allList); //만약 다른 페이지에서 끝내논 값이 있을 수 있기 떄문에 정렬(끝난 플랜을 밑으로)
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 0, 0, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 67.0),

                //페이지 제목
                child: Text(
                  'All Plan',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: ColorPallete.mainColor,
                  ),
                ),
              ),
              
              //페이지 나눔선
              SizedBox(
                width: 183,
                child: Divider(thickness: 3, color: ColorPallete.mainColor),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 35),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 30,

                      //모든 플랜들을 보여줄 수 있게 하는 버튼
                      child: ElevatedButton(
                        onPressed: () {
                          allList = widget.toDoList;
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.mainColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Text(
                          'All Plan',
                          style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: ColorPallete.textMainColor,
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        //체크박스 값으로 완료 유무체크하고 정렬까지 시켜주는 버튼
                        child: ElevatedButton(
                          onPressed: () {
                            Utils.doitCheckedTodos(allList);
                            Utils.sortAlignTodos(allList);
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.unselectedTextColor,
                            foregroundColor: ColorPallete.unselectedColor,
                            padding: EdgeInsets.zero,
                          ),
                          child: Icon(Icons.check, size: 24),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 56, 0),
                      child: SizedBox(
                        width: 60,
                        height: 30,

                        // 체크박스 값으로 체크된 데이터들 삭제해주는 버튼
                        child: ElevatedButton(
                          onPressed: () {
                            //다이어로그로 사용자의 실수 방지
                            Utils.showAlertDialog(
                              context: context,
                              title: '계획 삭제',
                              comment: '계획을 삭제 하시겠습니까?',
                              func: () {
                                //실질적인 삭제 함수불러옴
                                Utils.removeCheckedTodos(
                                  widget.toDoList,
                                  allList,
                                );
                                //삭제되었으면 스낵바로 한번더 메세지
                                Utils.showSnackBar(context: context,msg: '계획이 삭제되었습니다.');
                                setState(() {}); // 삭제 후에 setState
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorPallete.unselectedTextColor,
                            foregroundColor: ColorPallete.unselectedColor,
                            padding: EdgeInsets.zero,
                          ),
                          child: Icon(Icons.delete_forever, size: 24),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 60,
                      height: 30,

                      //카테고리를 선택해서 원하는 카테고리만 볼 수 있게 해주는 버튼
                      child: ElevatedButton(
                        onPressed: () {
                          //카테고리 선택창을 띄워주는 함수
                          showCategoryList(categorys: widget.categoryList);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.mainColor,
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.zero,
                        ),
                        child: Icon(Icons.arrow_drop_down, size: 24),
                      ),
                    ),
                  ],
                ),
              ),

              //ListView
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  //listview builder와 row간의 간격 없애기
                  itemCount: allList.length,
                  itemBuilder: (context, index) {
                    // Index를 이용해 하나의 리스트씩 넣어준다.
                    ToDo all = allList[index];

                    //Category가 어떤건지 알아내서 category에 넣어준다.
                    CategoryType category = widget.categoryList.firstWhere(
                      (category) => category.id == all.categoryId,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: SizedBox(
                        height: 120,
                        child: GestureDetector(
                          onTap: () {
                            //Card 선택시 해당 선택된 플랜의 수정창으로 이동
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => FixPlan(
                                      indexPlan: all,
                                      categoryType: widget.categoryList,
                                    ),
                              ),
                            ).then((value) {
                              setState(() {});
                            });
                          },
                          child: Column(
                            children: [
                              //생성날짜 띄우기 
                              Padding(
                                padding: const EdgeInsets.only(left: 190.0),
                                child: Text(
                                  'Creatived ${all.date.year}/${all.date.month}/${all.date.day}',
                                  style: TextStyle(
                                    fontFamily: 'Pretnedard',
                                    color: Colors.grey
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      16,
                                    ), 
                                  ),
                                  color:
                                      //완료된 플랜과 아닌 플랜을 구별 시켜주는 역할
                                      all.isDoit == true
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
                                          SizedBox(
                                            width: 155,
                                            height: 32,
                                            child: Text(
                                              all.title,
                                              style: TextStyle(
                                                fontFamily: 'Pretendard',
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: ColorPallete.mainColor,
                                              ),
                                            ),
                                          ),
                                
                                          SizedBox(
                                            width: 155,
                                            height: 32,
                                            child: Text(
                                              all.comment,
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
                                        value: all.isChecked,
                                        onChanged: (value) {
                                          all.isChecked = value!;
                                          setState(() {});
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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

      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 18),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          backgroundColor: ColorPallete.mainColor,
          foregroundColor: ColorPallete.textMainColor,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder:
                    (context) => AddPlan(
                      categoryList: widget.categoryList,
                      todoList: widget.toDoList,
                    ),
              ),
            ).then((value) {
              //데이터 값 추가
              Utils.addData(widget.toDoList);

              //따로 filterd가 없으니 원본을 그냥 너주기
              allList = widget.toDoList;
              setState(() {});
            });
          },
          child: Icon(Icons.add, size: 30),
        ),
      ),
    );
  }
  
  //카테고리 선택창
  showCategoryList({required List<CategoryType> categorys}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children:
              categorys.map((id) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: ListTile(
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
                      allList =
                          widget.toDoList.where((a) {
                            return a.categoryId == id.id;
                          }).toList();
                  
                      setState(() {});
                      Navigator.pop(context);
                    },
                  ),
                );
              }).toList(),
        );
      },
    );
  }
}
