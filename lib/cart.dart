import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/data/cart_model.dart';


class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://10.0.2.2:4000/'; // URL cơ sở cho hình ảnh

    return Scaffold(
      appBar: AppBar(
        title: Text('Giỏ hàng'),
        actions: [
IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              var item = cart.items[index];
              // Kiểm tra nếu img là null, sử dụng một giá trị mặc định
              String imageUrl = baseUrl + (item.product.img ?? 'assets/images/default.png');

              return ListTile(
                leading: Image.network(imageUrl, errorBuilder: (context, error, stackTrace) {
                  // Sử dụng hình ảnh mặc định nếu có lỗi khi tải hình ảnh từ URL
                  return Image.asset('assets/images/default.png');
                }),
                title: Text(item.product.name ?? 'No name'),
                subtitle: Text('Số lượng: ${item.quantity}'),
                trailing: Text('${item.product.price! * item.quantity} VND'),
                onLongPress: () {
                  cart.removeItem(item.product);
                },
              );
            },
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        child: Consumer<CartModel>(
          builder: (context, cart, child) {
            return Text(
              'Tổng cộng: ${cart.totalPrice} VND',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            );
          },
        ),
      ),
    );
  }
}
