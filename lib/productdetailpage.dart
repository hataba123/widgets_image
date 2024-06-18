import 'package:flutter/material.dart';
import 'package:widgets_image/components/product_titles.dart';
import 'package:widgets_image/constant.dart';
import 'package:widgets_image/data/model.dart';
import 'components/color_and_size.dart';
import 'components/fav_button.dart';
import 'components/description.dart';
import 'components/add_to_cart.dart';
import 'theme_provider.dart';
import 'dart:ui'; // Import for BackdropFilter and ImageFiltered

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String baseUrl = 'http://10.0.2.2:4000/';

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        iconTheme: IconThemeData(color: Colors.white),
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
                    padding: EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: size.height * 0.12),
                        ColorAndSize(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        Description(product: product),
                        SizedBox(height: kDefaultPaddin / 2),
                        CounterWithFavBtn(),
                        SizedBox(height: kDefaultPaddin / 2),
                        AddToCart(product: product),
                      ],
                    ),
                  ),
                  // Frosted Glass Effect
                  
                  ProductTitleWithImage(product: product, baseUrl: baseUrl),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
