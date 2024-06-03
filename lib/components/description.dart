import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
import '../constant.dart';

class Description extends StatelessWidget {
  final ProductModel product;

  const Description({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        product.des ?? 'Áo thun là loại trang phục phổ biến và thoải mái, thích hợp cho mọi lứa tuổi và mọi dịp. Chất liệu chủ yếu là cotton hoặc polyester, mềm mại và thấm hút mồ hôi tốt. Thiết kế của áo thun thường đơn giản, với cổ tròn hoặc cổ tim, tay ngắn hoặc dài. Áo thun có nhiều màu sắc và họa tiết phong phú, từ trơn màu đến in hình, chữ, hoặc logo.',
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
