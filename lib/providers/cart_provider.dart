import 'package:flutter/material.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice => _items.fold(
      0, (total, item) => total + (item.item.price * item.quantity));

  void addItem(CartItem cartItem) {
    final index =
        _items.indexWhere((item) => item.item.name == cartItem.item.name);
    if (index != -1) {
      _items[index].quantity += cartItem.quantity;
    } else {
      _items.add(cartItem);
    }
    notifyListeners();
  }
}
