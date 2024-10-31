import 'dart:io';

import 'shopping-mall.dart';

void main() {
  ShoppingMall mall = new ShoppingMall();
  bool exit = false;

  while (!exit) {
    print(
        '------------------------------------------------------------------------------------------------------');
    print(
        '''[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료
[6] 장바구니 초기화하기''');
    print(
        '------------------------------------------------------------------------------------------------------');
    String? request = stdin.readLineSync();
    exit = mall.showProducts(request);
  }
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
}
