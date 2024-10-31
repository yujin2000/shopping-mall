import 'dart:convert';
import 'dart:io';

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

class ShoppingMall {
  ShoppingMall();

  Map<Product, int> productsList = {};

  bool showProducts(String? request) {
    // productCount int 값이 제대로 바뀌지 않을때
    // print('입력값이 올바르지 않아요 !');
    int req = int.parse(request!);

    switch (req) {
      case 1:
        // 반복문 사용하기
        print('shirt / 45000원');
        print('one-piece / 30000원');
        print('T-shirt / 35000원');
        print('shorts / 30000원');
        print('socks / 5000원');
      case 2:
        print('상품 이름을 입력해 주세요 !');
        String? productName = stdin.readLineSync(encoding: Utf8Codec());
        int price = 0;
        if (productName == 'shirt') {
          price = 45000;
        } else if (productName == 'one-piece') {
          price = 40000;
        } else if (productName == 'T-shirt') {
          price = 35000;
        } else if (productName == 'shorts') {
          price = 30000;
        } else if (productName == 'socks') {
          price = 5000;
        } else {
          print('입력값이 올바르지 않아요 !');
          break;
        }
        print('상품 개수를 입력해 주세요 !');
        String? productCount = stdin.readLineSync();
        int count = int.parse(productCount!);
        // productCount int 값이 제대로 바뀌지 않을때
        // print('입력값이 올바르지 않아요 !');
        // productCount int 값이 제대로 바뀌지 않을때
        // print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
        // throw;
        addToCart(Product(productName!, price), count);
        print('장바구니에 상품이 담겼어요 !');
      case 3:
        if (productsList.isEmpty) {
          print('장바구니에 담긴 상품이 없습니다.');
        } else {
          print('장바구니에 ${showProductList()}가 담겨있네요. 총 ${showTotal()}원 어치입니다!');
        }
      case 4:
        print('정말 종료하시겠습니까? 종료를 원하신다면 [5] 를 눌러주세요.');
        var realExit = stdin.readLineSync();
        if (int.parse(realExit!) == 5) {
          return true;
        }
        print('종료하지 않습니다.');
      case 6:
        if (productsList.isEmpty) {
          print('이미 장바구니가 비어있습니다.');
        } else {
          initCart();
          print('장바구니를 초기화합니다.');
        }
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
    return false;
  }

  void addToCart(Product product, int count) {
    productsList.addAll({product: count});
  }

  int showTotal() {
    int totalPrice = 0;
    productsList.forEach((product, count) {
      totalPrice += product.price * count;
    });
    return totalPrice;
  }

  String showProductList() {
    return productsList.keys.map((e) => e.name).join(', ');
  }

  void initCart() {
    productsList.clear();
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
