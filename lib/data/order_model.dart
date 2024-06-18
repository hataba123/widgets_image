import 'package:flutter/material.dart';
import 'cart_model.dart';

class Order {
  final String id;
  final List<CartItem> items;
  final String address;
  final double discount;

  Order({required this.id, required this.items, required this.address,this.discount = 0.0});
  double get totalAmount {
    double total = 0.0;
    for (var item in items) {
      total += item.product.price! * item.quantity;
    }
    // Áp dụng giảm giá nếu có
    double discountAmount = total * (discount / 100);
    return total - discountAmount;
  }
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

