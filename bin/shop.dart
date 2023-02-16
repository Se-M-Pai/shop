import 'dart:io';
import 'package:intl/intl.dart';

void main(List<String> arguments) {

  var num = NumberFormat(".##");
  double number = double.parse(stdin.readLineSync()!);
  print(num.format(number));

}