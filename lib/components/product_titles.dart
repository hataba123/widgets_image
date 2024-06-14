import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
import '../constant.dart';
import 'package:intl/intl.dart';  // Import thư viện để format số

class ProductTitleWithImage extends StatelessWidget {
  final ProductModel product;
  final String baseUrl;

  const ProductTitleWithImage({Key? key, required this.product, required this.baseUrl}) : super(key: key);


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
                      text: NumberFormat('###,###,###').format(product.price) + ' VND',
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 50),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: Image.network(
                    baseUrl + (product.img ?? ''),
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image, size: 50, color: Colors.white);
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(),
          Text("Danh mục:"),
          Text(
           product.category ?? '' ,
          style: Theme.of(context)
                .textTheme
                .headlineLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
         
        ],
      ),
    );
  }
}
