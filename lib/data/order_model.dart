import 'package:flutter/material.dart';
import 'cart_model.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final String address;

  Order({required this.id, required this.items, required this.address});
}

class OrderModel with ChangeNotifier {
  final List<Order> _orders = [];

  List<Order> get orders => _orders;

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(String orderId) {
    _orders.removeWhere((order) => order.id == orderId);
    notifyListeners();
  }
}

