import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/language/language_constants.dart';
import '../data/order_model.dart';
import 'package:widgets_image/myorder.dart';
import 'package:dio/dio.dart';

class OrderPage extends StatefulWidget {
  final CartModel cart;

  OrderPage({required this.cart});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final String orderId = Uuid().v4();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController couponController = TextEditingController();
  double discount = 0.0;  // Thêm biến để lưu trữ phần trăm giảm giá
  String? discountMessage;

  Future<void> fetchDiscount(String coupon) async {
    final url = 'http://10.0.2.2:4000/api/v1/payment/discount?coupon=$coupon';
    try {
      var response = await Dio().get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        setState(() {
          discount = (data['discount'] as int).toDouble() / 100.0;  // Chuyển đổi thành double
          discountMessage = 'Mã giảm giá hợp lệ: ${data['discount']}%';
        });
      } else {
        setState(() {
          discountMessage = translation(context).magiamgiakhonghople;
          discount = 0.0;
        });
      }
    } on DioError catch (e) {
      setState(() {
        if (e.response != null) {
          discountMessage = 'Lỗi từ server: ${e.response?.data['message'] ?? 'Unknown error'}';
        } else {
          discountMessage = 'Không thể kết nối đến server: $e';
        }
        discount = 0.0;
      });
    } catch (e) {
      setState(() {
        discountMessage = 'Lỗi không xác định: $e';
        discount = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://10.0.2.2:4000/';

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).dathang),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.cart.items.length,
              itemBuilder: (context, index) {
                var item = widget.cart.items[index];
                String imageUrl = baseUrl + (item.product.img ?? 'assets/images/default.png');
                double price = (item.product.price ?? 0).toDouble(); // Chuyển đổi thành double
                double originalPrice = price * item.quantity;
                double discountedPrice = originalPrice * (1 - discount);

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
                        Text('Giá gốc: $originalPrice VND', style: TextStyle(fontSize: 16)),
                        if (discount > 0)
                          Text('Giá sau khi giảm: $discountedPrice VND', style: TextStyle(fontSize: 16, color: Colors.green)),
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
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: couponController,
                  decoration: InputDecoration(
                    labelText: translation(context).nhapmagiamgia,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 8),
                
                ElevatedButton(
                  onPressed: () {
                    final coupon = couponController.text;
                    fetchDiscount(coupon).then((_) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(discountMessage ?? translation(context).loikhinhapmagiamgia)),
                      );
                    });
                  },
                  child: Text(translation(context).kiemtramagiamgia),
                ),
                SizedBox(height: 8),
                TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    labelText: translation(context).nhapdiachicuaban,
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    String address = addressController.text;
                    if (address.isNotEmpty) {
                      Order order = Order(
                        id: orderId,
                        items: List.from(widget.cart.items),
                        address: address,
                      );
                      Provider.of<OrderModel>(context, listen: false).addOrder(order);
                      widget.cart.clearCart(); // Xóa giỏ hàng sau khi đặt hàng

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyOrdersPage(orderId: orderId),
                        ),
                      );
                    } else {
                      // Hiển thị thông báo nếu chưa nhập địa chỉ
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(translation(context).vuilongnhapdiachi),
                      ),);
                    }
                  },
                  child: Text(translation(context).dathang),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
