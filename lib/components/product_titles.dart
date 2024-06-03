import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
import '../constant.dart';
import '../config/const.dart';

class ProductTitleWithImage extends StatelessWidget {
  final ProductModel product;

  const ProductTitleWithImage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Text(
            product.name ?? '',
            style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${product.price}",
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.asset(
                   url_img + product.img!,                   
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
