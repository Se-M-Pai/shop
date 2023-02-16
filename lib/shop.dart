import 'dart:io';
import 'package:intl/intl.dart';

void main(List<String> arguments) {

  var num = NumberFormat(".##");
  /*double number = double.parse(stdin.readLineSync()!);
  print(num.format(number));*/

  int discountLevel = int.parse(stdin.readLineSync()!);

  switch(discountLevel){
    case 1:
      PriceFormatter prices = DiscountLevelOne();
      prices.price = double.parse(stdin.readLineSync()!);
      prices.discountPrice();
      break;
    case 2:
      PriceFormatter prices = DiscountLevelTwo();
      prices.price = double.parse(stdin.readLineSync()!);
      prices.discountPrice();
      break;
    case 3:
      PriceFormatter prices = DiscountLevelThree();
      prices.price = double.parse(stdin.readLineSync()!);
      prices.discountPrice();
      break;
    default:
      print("Error");
  }
}

class PriceFormatter {
  late double price;
  late int discountPercent;

  void discountPrice() {
    double discPrice = 0;
    print(discPrice);
  }
}

class DiscountLevelOne implements PriceFormatter {
  @override
  late double price;

  @override
  int discountPercent = 10;

  @override
  void discountPrice() {
    double discPrice = price * (1 - discountPercent / 100);
    print(discPrice);
  }
}

class DiscountLevelTwo implements PriceFormatter {
  @override
  late double price;

  @override
  int discountPercent = 20;

  @override
  void discountPrice() {
    double discPrice = price * (1 - discountPercent / 100);
    print(discPrice);
  }
}

class DiscountLevelThree implements PriceFormatter {
  @override
  late double price;

  @override
  int discountPercent = 30;

  @override
  void discountPrice() {
    double discPrice = price * (1 - discountPercent / 100);
    print(discPrice);
  }
}