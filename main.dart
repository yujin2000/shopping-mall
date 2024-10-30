import 'dart:convert';
import 'dart:io';

void main() {
  ShoppingMall mall = new ShoppingMall();
  bool exit = false;

  while (!exit) {
    print(
        '------------------------------------------------------------------------------------------------------');
    print(
        '[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print(
        '------------------------------------------------------------------------------------------------------');
    final String? request = stdin.readLineSync();
    exit = mall.showProducts(request);
  }
  print('이용해 주셔서 감사합니다 ~ 안녕히 가세요 !');
}

class ShoppingMall {
  ShoppingMall();

  List<Product> productsList = [];

  bool showProducts(String? request) {
    // productCount int 값이 제대로 바뀌지 않을때
    // print('입력값이 올바르지 않아요 !');
    int req = int.parse(request!);

    switch (req) {
      case 1:
        // 반복문 사용하기
        print('셔츠 / 45000원');
        print('원피스 / 30000원');
        print('반팔티 / 35000원');
        print('반바지 / 30000원');
        print('양말 / 5000원');
      case 2:
        print('상품 이름을 입력해 주세요 !');
        String? productName = stdin.readLineSync(encoding: utf8);
        // print('===> ${stdin.readLineSync(encoding: utf8)}');
        print('===> $productName');
        print('===> ${Encoding.getByName('utf-8')!}');
        if (productName != '셔츠' ||
            productName != '원피스' ||
            productName != '반팔티' ||
            productName != '반바지' ||
            productName != '양말') {
          print('입력값이 올바르지 않아요 !');
          break;
        }
        print('상품 개수를 입력해 주세요 !');
        int? productCount = stdin.readByteSync();
        // productCount int 값이 제대로 바뀌지 않을때
        // print('입력값이 올바르지 않아요 !');
        // productCount int 값이 제대로 바뀌지 않을때
        // print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        // throw;
        addToCart(Product(productName!, productCount));
        print('장바구니에 상품이 담겼어요 !');
      case 3:
        print('장바구니에 ${showTotal()}원 어치를 담으셨네요!');
      case 4:
        return true;
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
    return false;
  }

  void addToCart(Product product) {
    productsList.add(product);
  }

  int showTotal() {
    int totalPrice = 0;
    productsList.forEach((product) {
      totalPrice += product.price;
    });
    return totalPrice;
  }
}

class Product {
  Product(String name, int price) {
    this.name = name;
    this.price = price;
  }
  late String name;
  late int price;
}
