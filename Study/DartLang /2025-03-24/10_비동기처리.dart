main() {
  //동기방식 예시 checkversion -> checkVersion() -> lookupVersion() -> checkVersion()print()
  // 비동기 방식 checkVersion()이 비동기로 실행하는데 await으로 lookupVersion이 끝나야 하기 때문에 print('end Process')가 먼저 실행되고 출력시킨다.
  checkVersion();
  print('end Process'); //cpu1이 해라
}

checkVersion() async {
  //async를 붙이면 Cpu2 가 하고 있다. 근데 뭐가 먼저 끝날지 모르니깐
  var version = await lookupVersion(); //lookupVersion이 끝날떄 까지 기다리라고 await을 붙여준다.
  print(version);
}

int lookupVersion() {
  return 12;
}
