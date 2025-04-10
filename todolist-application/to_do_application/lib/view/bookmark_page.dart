import 'package:flutter/material.dart';
import 'package:to_do_aplication/model/category.dart';
import 'package:to_do_aplication/model/color_pallete.dart';
import 'package:to_do_aplication/model/todo.dart';
import 'package:to_do_aplication/utils/utils.dart';
import 'package:to_do_aplication/view/fix_plan.dart';

class BookmarkPage extends StatefulWidget {
  final List<ToDo> toDoList; //원본 플랜
  final List<CategoryType> categoryList; //원본 카테고리

  const BookmarkPage({
    super.key,
    required this.toDoList,
    required this.categoryList,
  });

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late List<ToDo> bookmarkedTodos; //북마크 가 true인 데이터만 빼서 넣을 list 변수
  DateTime selectedDate = DateTime.now(); // 캘린더에서 선택된 날짜 저장 처음엔 오늘거

  @override
  void initState() {
    super.initState();

    filterBookMark();
  }

  //bookmark가 ture인 아이들만 bookmarkedTodos에 저장 시키는 함수
  filterBookMark() {
    bookmarkedTodos =
        widget.toDoList.where((todo) {
          return todo.isBookmarked == true;
        }).toList();

    Utils.sortAlignTodos(bookmarkedTodos); // 정렬 시키는 함수 실행
  }

  //북마크된 상태에 날짜까지 맞는 날짜인 플랜만 저장 시키는 함수
  filterDateAndBookMark() {
    bookmarkedTodos =
        widget.toDoList.where((todo) {
          return todo.isBookmarked == true &&
              todo.date.year == selectedDate.year &&
              todo.date.month == selectedDate.month &&
              todo.date.day == selectedDate.day;
        }).toList();
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
                  'BookMark',
                  style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: ColorPallete.mainColor,
                  ),
                ),
              ),

              //제목과 기능 구분
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: 248,
                  child: Divider(thickness: 3, color: ColorPallete.mainColor),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: Row(
                  children: [

                    //기본 별버튼 누르면 전체 bookmark is true 보게 하는 버튼
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          filterBookMark();
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: ColorPallete.mainColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.star, size: 24),
                      ),
                    ),

                    //해당 날짜에 있는 bookmark is ture인 것들만 보여주기
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 126, 0),
                      child: SizedBox(
                        width: 60,
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () async {
                            final DateTime? picked = await showDatePicker(
                              context: context,
                              firstDate: DateTime(2021),
                              lastDate: DateTime(2028),
                            );

                            if (picked != null && picked != selectedDate) {
                              selectedDate = picked;
                              filterBookMark();
                              filterDateAndBookMark();
                              setState(() {});
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: ColorPallete.unselectedTextColor,
                            foregroundColor: ColorPallete.unselectedColor,
                          ),
                          child: Icon(Icons.date_range, size: 24),
                        ),
                      ),
                    ),

                    //해당 카테고리만 볼 수 있게 하는 버튼
                    SizedBox(
                      width: 60,
                      height: 30,
                      child: ElevatedButton(
                        onPressed: () {
                          showCategoryList(categorys: widget.categoryList);
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: ColorPallete.mainColor,
                          foregroundColor: Colors.white,
                        ),
                        child: Icon(Icons.arrow_drop_down, size: 24),
                      ),
                    ),
                  ],
                ),
              ),

              //Card형태로 listview사용
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: bookmarkedTodos.length,
                  itemBuilder: (context, index) {
                    ToDo bookmark = bookmarkedTodos[index];

                    CategoryType categoryA = widget.categoryList.firstWhere(
                      (category) => category.id == bookmark.categoryId,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: SizedBox(
                        height: 120,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 190.0),
                              child: Text(
                                //날짜 표시
                                'Plan Date ${bookmark.date.year}/${bookmark.date.month}/${bookmark.date.day}',
                                style: TextStyle(
                                  fontFamily: 'Pretnedard',
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 100,
                              child: GestureDetector(
                                onTap: () {
                                  // 눌렀을때 고칠 수 있게
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => FixPlan(
                                            indexPlan: bookmark,
                                            categoryType: widget.categoryList,
                                          ),
                                    ),
                                  ).then((value) {
                                    setState(() {});
                                  });
                                },
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      16,
                                    ), // 원하는 radius 값
                                  ),
                                  color:
                                      bookmark.isDoit == true
                                          ? ColorPallete.doitPlanColor
                                          : ColorPallete.textfieldColor,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      // Category에 맞는 Icon
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 10.0,
                                        ),
                                        child: SizedBox(
                                          width: 40,
                                          height: 40,
                                          child: Icon(
                                            categoryA.icon,
                                            size: 40,
                                            color: ColorPallete.mainColor,
                                          ),
                                        ),
                                      ),

                                      // Plan에 맞는 title과 comment
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 155,
                                            height: 32,
                                            child: Text(
                                              bookmark.title,
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
                                              bookmark.comment,
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

                                      GestureDetector(
                                        onTap: () {
                                          bookmark.isBookmarked != true
                                              ? bookmark.isBookmarked = true
                                              : bookmark.isBookmarked = false;

                                          setState(() {});
                                        },
                                        child: Icon(
                                          bookmark.isBookmarked == true
                                              ? Icons.star
                                              : Icons.star_border,

                                          size: 24,
                                          color: ColorPallete.mainColor,
                                        ),
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
                  },
                ),
              ),
            ],
          ),
        ),
      ),

      //새로고침 버튼(북마크값 반영)
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 18, 18),
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),

          backgroundColor: ColorPallete.mainColor,
          foregroundColor: ColorPallete.textMainColor,
          onPressed: () {
            Utils.showAlertDialog(
              context: context,
              title: '북마크 새로 고침',
              comment: '변경시킨 북마크 값을 적용 시킵니다.',
              func: () {
                Utils.showSnackBar(context: context, msg: '북마크가 해제되었습니다.');
                filterBookMark();
                setState(() {});
              },
            );
          },
          child: Icon(Icons.refresh, size: 30),
        ),
      ),
    );
  }

  //카테고리 선택창 띄우고 그 카테고리만 나오게
  showCategoryList({required List<CategoryType> categorys}) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children:
              categorys.map((id) {
                return Column(
                  children: [
                    ListTile(
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
                        bookmarkedTodos =
                            widget.toDoList.where((a) {
                              return a.isBookmarked == true &&
                                  a.categoryId == id.id;
                            }).toList();

                        setState(() {});
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              }).toList(),
        );
      },
    );
  }
}
