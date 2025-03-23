// 구구단은 2단부터 9단
// 구구단의 형태는 A X B X C
// 정수 N이 주어졌을때 A B C 중 어느 하나라도 해당하면 1 아니면 0
// N의 범위는 1이상 100이하
main() {
  int n = 1;
  int result = 0;
  List<int> a = [2, 3, 4, 5, 6, 7, 8, 9];
  List<int> b = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> c = [];

  for (int aN = 0; aN < a.length; aN++) {
    for (int bN = 0; bN < b.length; bN++) {
      c.add(a[aN] * b[bN]);
    }
  }

  for (int i in a) {
    if (n == i) {
      result = 1;
      break;
    } else {
      for (int ii in b) {
        if (n == ii) {
          result = 1;
          break;
        } else {
          for (int iii in c) {
            if (n == iii) {
              result = 1;
              break;
            }
          }
        }
      }
    }
  }

  print(result);
}
