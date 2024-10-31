import 'dart:convert';
import 'dart:io';

import 'product.dart';

class ShoppingMall {
  ShoppingMall();

  Map<Product, int> productsCart = {};
  List<Product> productsList = [
    Product('shirt', 45000),
    Product('one-piece', 30000),
    Product('T-shirt', 35000),
    Product('shorts', 38000),
    Product('socks', 5000)
  ];

  bool showProducts(String? request) {
    int req = 0;
    try {
      req = int.parse(request!);
    } catch (e) {}
    switch (req) {
      case 1:
        for (Product p in productsList) {
          print('${p.name} / ${p.price}');
        }
      case 2:
        print('상품 이름을 입력해 주세요 !');
        try {
          String? productName = stdin.readLineSync(encoding: Utf8Codec());
          int price = 0;
          late Product product;
          productsList.forEach((element) {
            if (element.name == productName) {
              price = element.price;
              product = element;
            }
          });
          if (price == 0) {
            print('입력값이 올바르지 않아요 !');
            break;
          }
          print('상품 개수를 입력해 주세요 !');

          String? productCount = stdin.readLineSync();
          int count = int.parse(productCount!);

          if (count > 0) {
            addToCart(product, count);
            print('장바구니에 상품이 담겼어요 !');
          } else {
            print('0개보다 많은 개수의 상품만 담을 수 있어요 !');
          }
        } catch (e) {
          print('입력값이 올바르지 않아요 !');
        }
      case 3:
        if (productsCart.isEmpty) {
          print('장바구니에 담긴 상품이 없습니다.');
        } else {
          print(
              '장바구니에 ${showProductNameList()}가 담겨있네요. 총 ${showTotal()}원 어치입니다!');
        }
      case 4:
        print('정말 종료하시겠습니까? 종료를 원하신다면 [5] 를 눌러주세요.');
        try {
          var realExit = stdin.readLineSync();
          if (int.parse(realExit!) == 5) {
            return true;
          }
        } catch (e) {
          print('종료하지 않습니다.');
        }
      case 6:
        if (productsCart.isEmpty) {
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
    if (productsCart.keys.contains(product)) {
      productsCart.update(product, (value) => value + count);
    } else {
      productsCart.addAll({product: count});
    }
  }

  int showTotal() {
    int totalPrice = 0;
    productsCart.forEach((product, count) {
      totalPrice += product.price * count;
    });
    return totalPrice;
  }

  String showProductNameList() {
    return productsCart.keys.map((e) => e.name).join(', ');
  }

  void initCart() {
    productsCart.clear();
  }
}
