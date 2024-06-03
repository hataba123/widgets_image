import 'package:flutter/material.dart';
import 'package:widgets_image/components/product_titles.dart';
import 'package:widgets_image/constant.dart';
import 'package:widgets_image/data/model.dart';
import 'components/color_and_size.dart';
import 'components/fav_button.dart';
import 'components/description.dart';
import 'components/add_to_cart.dart';
import 'components/product_titles.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
    
        elevation: 0,
       
        actions: <Widget>[
         
          SizedBox(width: kDefaultPaddin / 2)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        ColorAndSize(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        Description(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: kDefaultPaddin / 2),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
