import 'package:flutter/foundation.dart';
import 'package:shop/models/catalog.dart';

/*class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  final List<int> _itemIds = [];


  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(Item item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(Item item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}*/
final Map<int, int> itemCounts = {};
class CartModel extends ChangeNotifier {
  late CatalogModel _catalog;

  //final Map<int, int> itemCounts = {}; // Добавлено новое поле для хранения количества товаров

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
    notifyListeners();
  }

  List<Item> get items => itemCounts.keys.map((id) => _catalog.getById(id)!).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price * itemCounts[current.id]!); // Учитываем количество товаров

  int itemCount(Item item) => itemCounts[item.id] ?? 0; // Возвращает количество товаров в корзине

  void add(Item item) {
    itemCounts[item.id] = (itemCounts[item.id] ?? 0) + 1; // Увеличиваем количество товара на 1
    notifyListeners();
  }

  void remove(Item item) {
    final count = itemCounts[item.id] ?? 0;
    if (count > 1) {
      itemCounts[item.id] = count - 1; // Уменьшаем количество товара на 1
    } else {
      itemCounts.remove(item.id); // Удаляем товар из корзины, если количество достигло 0
    }
    notifyListeners();
  }

  void setItemCount(Item item, int count) {
    if (count > 0) {
      itemCounts[item.id] = count; // Устанавливаем количество товаров в корзине
    } else {
      itemCounts.remove(item.id); // Удаляем товар из корзины, если количество достигло 0
    }
    notifyListeners();
  }
}