import 'dart:io';

import 'exception.dart';
import 'shopping-mall.dart';

void main() {
  ShoppingMall mall = new ShoppingMall();
  bool exit = false;

  while (!exit) {
    print(
        '------------------------------------------------------------------------------------------------------');
    print(
        '''[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
[6] 장바구니 초기화하기 / [7] 상품 등록하기 / [8] 상품 삭제하기''');
    print(
        '------------------------------------------------------------------------------------------------------');
    String? request = stdin.readLineSync();
    try {
      exit = mall.showProducts(request);
    } on IncorrectInputExpcetion catch (e) {
      print(e.message == null ? '입력값이 올바르지 않아요 !' : e.message);
    }
  }
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
}
