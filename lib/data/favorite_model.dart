import 'package:flutter/material.dart';
import 'package:widgets_image/data/model.dart';
 // Ensure this path is correct

class FavoritesModel with ChangeNotifier {
  final List<ProductModel> _favorites = [];

  List<ProductModel> get favorites => _favorites;

  void addFavorite(ProductModel product) {
    if (!_favorites.contains(product)) {
      product.isFavorite = true;
      _favorites.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(ProductModel product) {
    if (_favorites.contains(product)) {
      product.isFavorite = false;
      _favorites.remove(product);
      notifyListeners();
    }
  }

  bool isFavorite(ProductModel product) {
    return _favorites.contains(product);
  }
}
