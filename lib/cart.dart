import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'orderpage.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://10.0.2.2:4000/'; // Base URL for images

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).giohang),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text(translation(context).thongbaogiohangtrong));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              var item = cart.items[index];
              String imageUrl = item.product.img != null ? baseUrl + item.product.img! : 'assets/images/default.png';

              return ListTile(
                    key: Key(item.product.id.toString()),
                leading: Image.network(
                  imageUrl,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/default.png', width: 50, height: 50, fit: BoxFit.cover);
                  },
                ),
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
      bottomNavigationBar: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Tổng cộng: ${cart.totalPrice.toStringAsFixed(2)} VND', // Format totalPrice as needed
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: cart.items.isEmpty
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(cart: cart),
                            ),
                          );
                        },
                  child: Text(translation(context).dathang),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
