import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';

class FavoritesProvider with ChangeNotifier {
  List<ProductModel> _favoriteProducts = [];

  List<ProductModel> get favoriteProducts => _favoriteProducts;

  void toggleFavorite(ProductModel product) {
    final isExisting = _favoriteProducts.contains(product);
    if (isExisting) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
    product.isFavorite = !isExisting;
    notifyListeners();
  }
}
