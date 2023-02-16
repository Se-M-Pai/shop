import 'dart:io';
import 'package:intl/intl.dart';

void main(List<String> arguments) {

  var num = NumberFormat(".##");
  double number = double.parse(stdin.readLineSync()!);
  print(num.format(number));

  PriceFormatter

  /*Employee bob = Employee("Bob", "Google");
  bob.display();  // Employee name: Bob
  bob.work();     // Employee works in Google*/
}

class PriceFormatter {
  late double price;
  late int discountPercent;

  void discountPrice() {
    double discPrice = price * (1 - discountPercent / 100);
  }
}

class ExampleUnitTest implements PriceFormatter {
  @override
  double price = double.parse(stdin.readLineSync()!);

  @override
  late int discountPercent;

  @override
  void discountPrice() {
    super()
  }
}

class Person{

  String name;
  Person(this.name);

  void display(){
    print("Name: $name");
  }
}
class Worker{
  String company = "";
  void work(){
    print("Work in $company");
  }
}
class Employee implements Person, Worker{

  String name;            // реализация поля name из Person
  String company;         // реализация поля company из Worker
  // реализация метода display Person
  void display(){
    print("Employee name: $name");
  }
  // реализация метода work из Worker
  void work(){
    print("Employee works in $company");
  }

  Employee(this.name, this.company);
}*/
