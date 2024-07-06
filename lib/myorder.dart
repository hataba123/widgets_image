import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/language/language_constants.dart';
import '../data/order_model.dart';
import 'package:widgets_image/page/home.dart';

class MyOrdersPage extends StatefulWidget {
  final String orderId;

  MyOrdersPage({required this.orderId});

  @override
  _MyOrdersPageState createState() => _MyOrdersPageState();
}

class _MyOrdersPageState extends State<MyOrdersPage> {
  Set<String> selectedOrders = Set<String>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).donhangcuatoi),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome()),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              final orderModel = Provider.of<OrderModel>(context, listen: false);
              setState(() {
                selectedOrders.forEach((orderId) {
                  orderModel.removeOrder(orderId);
                });
                selectedOrders.clear();
              });
            },
          ),
        ],
      ),
      body: Consumer<OrderModel>(
        builder: (context, orderModel, child) {
          return ListView.builder(
            itemCount: orderModel.orders.length,
            itemBuilder: (context, index) {
              var order = orderModel.orders[index];
              return Card(
                margin: EdgeInsets.all(8),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'ID đơn hàng: ${order.id}',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Checkbox(
                            value: selectedOrders.contains(order.id),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value == true) {
                                  selectedOrders.add(order.id);
                                } else {
                                  selectedOrders.remove(order.id);
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      ...order.items.map((item) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ID sản phẩm: ${item.product.id}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            SizedBox(height: 8),
                            Text('Tên sản phẩm: ${item.product.name}', style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Text('Số lượng: ${item.quantity}', style: TextStyle(fontSize: 16)),
                            SizedBox(height: 8),
                            Text('Giá: ${item.product.price! * item.quantity} VND', style: TextStyle(fontSize: 16)),
                          ],
                        );
                      }).toList(),
                      SizedBox(height: 8),
                      Text('Địa chỉ: ${order.address}', style: TextStyle(fontSize: 16)),
                      SizedBox(height: 8),
                      Text('Tổng giá: ${order.totalAmount} VND', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
