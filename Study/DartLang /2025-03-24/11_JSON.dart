import 'dart:convert';
//Json을 convert해주는 것 안에 incode , decode가 있음

main() {
  //[] = List {} = Map []안에 {}하나가 []의 0번지이다. 이런 형태가 Json형태이다.
  var jsonString = ''' 
[
  {
    "Score" : 40 
  },
  {
    "Score" : 80
  }
]
'''; //'''String''' 지금 [0]에는 "Score" : 40 [1]에는 "Score" : 80

  var scores = jsonDecode(jsonString);
  //incode - 압축
  //decode - 압축해제

  print(scores);
  var firstScore = scores[0];
  print(firstScore); //score[0]번을 가지고 옴
  print(firstScore['Score']); //score[0]번째에 점수만 가지고 오는것

  print(scores[0]['Score']); //위와 같은 형태 보통 이형태를 많이 사용한다.
}
