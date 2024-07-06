import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/productdetailpage.dart';

class FavoritesPage extends StatelessWidget {
  final List<ProductModel> favoriteProducts;
  final String baseUrl = 'http://10.0.2.2:4000/';

  const FavoritesPage({required this.favoriteProducts, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).danhsachyeuthich, style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[100]!, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: favoriteProducts.isEmpty
            ? Center(
                child: Text(
                  translation(context).khongcosanphamyeuthich,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              )
            : ListView.builder(
                itemCount: favoriteProducts.length,
                itemBuilder: (context, index) {
                  final product = favoriteProducts[index];
                  return ListTile(
                    leading: product.img != null
                        ? Image.network(
                            baseUrl + product.img!,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image, size: 50),
                    title: Text(product.name ?? ''),
                    subtitle: Text(product.des ?? ''),
                    trailing: IconButton(
                      icon: const Icon(Icons.arrow_forward),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProductDetailPage(product: product),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
      ),
    );
  }
}
