import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:widgets_image/data/cart_model.dart';
import '../data/order_model.dart';
import 'package:widgets_image/myorder.dart';

class OrderPage extends StatelessWidget {
  final CartModel cart;
  final String orderId = Uuid().v4();
  final TextEditingController addressController = TextEditingController();

  OrderPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://10.0.2.2:4000/';

    return Scaffold(
      appBar: AppBar(
        title: Text('Đặt hàng'),
      ),
      body: ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) {
          var item = cart.items[index];
          String imageUrl = baseUrl + (item.product.img ?? 'assets/images/default.png');

          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('ID đơn hàng: $orderId', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),                 
                  Text('Tên sản phẩm: ${item.product.name}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Số lượng: ${item.quantity}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Text('Địa chỉ: ', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  TextField(
                    controller: addressController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Nhập địa chỉ của bạn',
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Giá: ${item.product.price! * item.quantity} VND', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 8),
                  Image.network(imageUrl, errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/default.png');
                  }),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            String address = addressController.text;
            if (address.isNotEmpty) {
              Order order = Order(
                id: orderId,
                items: List.from(cart.items),
                address: address,
              );
              Provider.of<OrderModel>(context, listen: false).addOrder(order);
              cart.clearCart(); // Xóa giỏ hàng sau khi đặt hàng

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyOrdersPage(orderId: orderId),
                ),
              );
            } else {
              // Hiển thị thông báo nếu chưa nhập địa chỉ
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Vui lòng nhập địa chỉ')),
              );
            }
          },
          child: Text('Đặt hàng'),
        ),
      ),
    );
  }
}