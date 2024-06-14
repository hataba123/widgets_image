import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
import '../constant.dart';
import 'package:intl/intl.dart';  // Import thư viện để format số

class ProductTitleWithImage extends StatelessWidget {
  final ProductModel product;
  final String baseUrl;

  const ProductTitleWithImage({Key? key, required this.product, required this.baseUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
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
                  TextSpan(text: "Giá\n"),
                  TextSpan(
                    text: NumberFormat('###,###,###').format(product.price) + ' VND',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Expanded(
              child: Hero(
                tag: "${product.id}",
                child: Container(
                  width: 250, // Set the desired width
                  height: 200, // Set the desired height
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent), // Optional border
                    borderRadius: BorderRadius.circular(10), // Optional rounded corners
                    color: Colors.transparent, // Background color
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Same as the container border radius
                    child: product.img != null
                        ? Image.network(
                            baseUrl + (product.img ?? ''),
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Icon(Icons.broken_image, size: 50, color: Colors.white);
                            },
                          )
                        : Image.asset(
                            'assets/images/default_image.png', // Path to default image
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Text("Danh mục:"),
        Text(
          product.category ?? '',
          style: Theme.of(context)
              .textTheme
              .headlineLarge
              ?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
