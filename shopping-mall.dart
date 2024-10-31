import 'dart:convert';
import 'dart:io';

import 'product.dart';

class ShoppingMall {
  ShoppingMall();

  // 장바구니
  Map<Product, int> productsCart = {};
  // 상품 리스트
  List<Product> productsList = [
    Product('shirt', 45000),
    Product('one-piece', 30000),
    Product('T-shirt', 35000),
    Product('shorts', 38000),
    Product('socks', 5000)
  ];

  // 쇼핑몰 시작
  bool showProducts(String? request) {
    int req = 0;
    try {
      req = int.parse(request!);
    } catch (e) {}

    switch (req) {
      case 1: // 상품 목록 출력
        for (Product p in productsList) {
          print('${p.name} / ${p.price}');
        }
      case 2: // 장바구니 담기
        print('상품 이름을 입력해 주세요 !');
        try {
          String? productName = stdin.readLineSync(encoding: Utf8Codec());
          int price = 0;
          late Product product;
          // 상품 리스트에서 입력 받은 상품 이름과 같은 이름의 Product 객체를 가져와서
          // 객체의 가격을 등록하고 product 변수에 객체 변수 할당
          productsList.forEach((element) {
            if (element.name == productName) {
              price = element.price;
              product = element;
            }
          });

          // 가격이 0 원이면 올바른 상품 입력을 받지 않은 것으로 간주하고 break
          if (price == 0) {
            print('입력값이 올바르지 않아요 !');
            break;
          }
          print('상품 개수를 입력해 주세요 !');

          String? productCount = stdin.readLineSync();
          int count = int.parse(productCount!);

          // 위에서 할당 받은 product 객체와 개수 장바구니에 추가
          if (count > 0) {
            addToCart(product, count);
            print('장바구니에 상품이 담겼어요 !');
          } else {
            print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
          }
        } catch (e) {
          print('입력값이 올바르지 않아요 !');
        }
      case 3: // 장바구니에 담긴 상품들 확인
        if (productsCart.isEmpty) {
          print('장바구니에 담긴 상품이 없습니다.');
        } else {
          print(
              '장바구니에 ${showProductNameList()}가 담겨있네요. 총 ${showTotal()}원 어치입니다!');
        }
      case 4: // 쇼핑몰 종료
        print('정말 종료하시겠습니까? 종료를 원하신다면 [5] 를 눌러주세요.');
        try {
          var realExit = stdin.readLineSync();
          if (int.parse(realExit!) == 5) {
            return true;
          }
        } catch (e) {
          print('종료하지 않습니다.');
        }
      case 6: // 장바구니 초기화
        initCart();
      default:
        print('지원하지 않는 기능입니다 ! 다시 시도해 주세요 ..');
    }
    return false;
  }

  // 장바구니에 상품, 개수 추가
  void addToCart(Product product, int count) {
    if (productsCart.keys.contains(product)) {
      productsCart.update(product, (value) => value + count);
    } else {
      productsCart.addAll({product: count});
    }
  }

  // 장바구니에 담겨있는 상품들의 총 가격
  int showTotal() {
    int totalPrice = 0;
    productsCart.forEach((product, count) {
      totalPrice += product.price * count;
    });
    return totalPrice;
  }

  // 장바구니에 담겨있는 상품들의 이름
  String showProductNameList() {
    return productsCart.keys.map((e) => e.name).join(', ');
  }

  // 장바구니 초기화
  void initCart() {
    if (productsCart.isEmpty) {
      print('이미 장바구니가 비어있습니다.');
    } else {
      productsCart.clear();
      print('장바구니를 초기화합니다.');
    }
  }
}
