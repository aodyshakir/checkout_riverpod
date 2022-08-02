import 'package:checkout_riverpod/model/item.dart';
import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  List<Item> _item = [];

  double _totalPrice = 0.0;

  List<Item> get item => _item;

  void add(Item item) {
    _item.add(item);

    _totalPrice += item.price;
    notifyListeners();
  }

  remove(Item item) {
    _item.remove(item);
    _totalPrice -= item.price;
    notifyListeners();
  }

  int get count {
    return _item.length;
  }

  double get totalPrice {
    return _totalPrice;
  }

  void clear() {
    _item.clear();
    _totalPrice = 0.0;
    notifyListeners();
  }

 
}
