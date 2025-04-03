import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  //property
  late DateTime date; //현재 날짜 시간은 OS가 알고 있다.
  late String selectDateText; //선택한 날짜 보여주기 위한 저장 공간

  @override
  void initState() {
    super.initState();
    date = DateTime.now(); //현재 Date 데이터를 가지고온다.
    selectDateText = ""; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Date Picker Example'),
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            Text(
              // '현재 일자는 : ${date.toString()}'
              '현재 일자는 :${date.year.toString().padLeft(2,'0')}/${date.month.toString().padLeft(2,'0')}/${date.day.toString().padLeft(2,'0')}'
              //date를 잘라서 자기가 원하는 부분만 사용 할 수 있다.
              //padLeft 앞에 붙이기
            ),
            ElevatedButton(
              onPressed: () => disDatePicker(), 
              child: Text('Date Picker'), //Callender 불러오기
              ),
            Text(selectDateText),//클릭한 날짜 보여주기
          ],
        ),
      ),
    );
  }
  disDatePicker() async{
    //DatePicker는 기본적으로 async다.
    //DatePicker는 어디부터 어디까지 범위를 정해줘야한다.
    // print(date.year);
    int firstYear = date.year -1;//2024년 부터 하겠다
    int lastYear  = firstYear + 5; //firstYear+5년까지 사용하겠다

    final selectedDate = await showDatePicker( //캘린더를 띄우는 아이 선택한 값이 selectedData로 들어간다.
      context: context, 
      initialDate: date,
      //첫화면에 어느 날짜를 보여줄 것인가
      firstDate: DateTime(firstYear), 
      lastDate: DateTime(lastYear),
      //데이터타입이 달라서 DateTime으로 변환 해야한다.
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      //캘린더 타입
      locale: Locale('ko', 'KR'), //언어 설정 Main title밑에 권한주고 puspec.yaml에 설정
    );
    if(selectedDate != null){
      //캘린더 값을 안준게 아니라 준거면 
      selectDateText  = '선택 하신 일자는 ${selectedDate.toString().substring(0,10)} 입니다.';
      //subString은 어디서부터 어디까지만 가지고 오겠다.
      setState(() {});
    }   
  }
}