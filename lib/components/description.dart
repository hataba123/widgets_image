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
        product.des ?? '',
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
