import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/foundation.dart';
import 'package:shop/models/catalog.dart';


class ShopController {
  //var num = NumberFormat(".##");
  //double number = double.parse(stdin.readLineSync()!);
  //print(num.format(number));

  late int discountLevel;
}

class PriceFormatter {
  double discountPercent = 0.0;

  void discountPrice() {
    double discPrice = (1 - discountPercent / 100);
    print(discPrice);
  }
  void debugprint(){
    debugPrint(discountPercent.toString());
  }

}

class DiscountLevelZero implements PriceFormatter {

  @override
  double discountPercent = 0.0;

  @override
  void discountPrice() {
    double discPrice = (1 - discountPercent / 100);
    print(discPrice);
  }

  void debugprint(){
    debugPrint(discountPercent.toString());
  }
}

class DiscountLevelOne implements PriceFormatter {

  @override
  double discountPercent = 11.0;

  @override
  void discountPrice() {
    double discPrice = (1 - discountPercent / 100);
    print(discPrice);
  }

  void debugprint(){
    debugPrint(discountPercent.toString());
  }
}

class DiscountLevelTwo implements PriceFormatter {

  @override
  double discountPercent = 22.0;

  @override
  void discountPrice() {
    double discPrice = (1 - discountPercent / 100);
    print(discPrice);
  }

  void debugprint(){
    debugPrint(discountPercent.toString());
  }
}

class DiscountLevelThree implements PriceFormatter {
  @override
  double discountPercent = 33.0;

  @override
  void discountPrice() {
    double discPrice = (1 - discountPercent / 100);
    print(discPrice);
  }

  void debugprint(){
    debugPrint(discountPercent.toString());
  }
}