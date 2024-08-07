import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/components/product_titles.dart';
import 'package:widgets_image/constant.dart';
import 'package:widgets_image/data/model.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/page/favorites_provider.dart';
import 'package:widgets_image/page/home.dart';
import 'components/color_and_size.dart';
import 'components/fav_button.dart';
import 'components/description.dart';
import 'components/add_to_cart.dart';
import 'dart:ui';

class ProductDetailPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailPage({required this.product, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final String baseUrl = 'http://10.0.2.2:4000/';
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
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
            icon: Icon(
              product.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              favoritesProvider.toggleFavorite(product);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.green,
                  content: Text(
                    product.isFavorite
                        ? translation(context).dathemvaoyeuthich
                        : translation(context).daxoakhoiyeuthich,
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
          ),
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
                  ProductTitleWithImage(product: product, baseUrl: baseUrl),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
