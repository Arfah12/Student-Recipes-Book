import 'package:flutter/material.dart';
import '../models/shopping_item.dart';

class ShoppingListProvider extends ChangeNotifier {
  final List<ShoppingItem> _items = [];

  List<ShoppingItem> get items => _items;

  void addItems(List<String> names) {
  for (var name in names) {
    if (!_items.any((item) => item.name == name)) {
      _items.add(ShoppingItem(name: name));
    }
  }
  notifyListeners();
}


  void toggleBought(String name) {
    final item = _items.firstWhere((e) => e.name == name);
    item.isBought = !item.isBought;
    notifyListeners();
  }

  void removeItem(String name) {
    _items.removeWhere((e) => e.name == name);
    notifyListeners();
  }

  void clearAll() {
    _items.clear();
    notifyListeners();
  }
}
