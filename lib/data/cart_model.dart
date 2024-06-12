import 'package:flutter/material.dart';
import 'model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({
    required this.product,
    this.quantity = 1,
  });
}

class CartModel with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(ProductModel product) {
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void removeItem(ProductModel product) {
    _items.removeWhere((item) => item.product.id == product.id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.product.price! * item.quantity);
  }
}
