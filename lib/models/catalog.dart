import 'dart:math';

import 'package:flutter/material.dart';

class CatalogModel {
  static List<String> itemNames = [
    'Хлеб',
    'Молоко',
    'Сок',
    'Газировка',
    'Лимонад',
    'Макароны',
    'Спагетти',
    'Гречка',
    'Рис',
    'Булгур',
    'Кефир',
    'Йогурт',
    'Сыр',
    'Торт',
    'Пирожное',
  ];

  static List<String> description = [
    'Описание товара: Свежий хлеб',
    'Описание товара: Парное молоко',
    'Описание товара: Сок на любой вкус',
    'Описание товара: Сильногазированная газировка',
    'Описание товара: Лимонад как в детстве',
    'Описание товара: Макароны для любого случая',
    'Описание товара: Спагетти',
    'Описание товара: Дешевая гречка',
    'Описание товара: Японский рис',
    'Описание товара: Полезный булгур',
    'Описание товара: Обезжиренный кефир',
    'Описание товара: Вкусный йогурт',
    'Описание товара: Твердый сыр',
    'Описание товара: Вкусный торт',
    'Описание товара: Сладкое пирожное',
  ];

  Item getById(int id) => Item(id, itemNames[id % itemNames.length], description[id % description.length]);

  Item getByPosition(int position) {
    return getById(position);
  }
}

@immutable
class Item {
  final int id;
  final String name;
  final String description;
  final Color color;
  final int price = 420;

  Item(this.id, this.name, this.description)
      : color = Colors.primaries[id % Colors.primaries.length];

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Item && other.id == id;
}