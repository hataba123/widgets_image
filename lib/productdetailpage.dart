import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? ''),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/${product.img}', // Đường dẫn của hình ảnh
              width: MediaQuery.of(context).size.width, // Đặt kích thước của hình ảnh
              height: 400,
            ),
            SizedBox(height: 20), // Khoảng cách giữa ảnh và văn bản
            Text('Áo thể thao mát lạnh'),
          ],
        ),
      ),
    );
  }
}