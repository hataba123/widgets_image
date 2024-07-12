import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/data/model.dart';
import 'package:widgets_image/productdetailpage.dart';
import 'package:widgets_image/theme_provider.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/category_list.dart';

import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/global.dart' as globals;

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<ProductModel> categoryProducts = [];
  List<String> categories = [];
  String? selectedCategory;

  List<dynamic>? jsonList; 
  final String baseUrl = 'http://10.0.2.2:4000/';

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    try {
      var response = await Dio().get('http://10.0.2.2:4000/api/v1/product/categories');
      if (response.statusCode == 200) {
        setState(() {
          categories = List<String>.from(response.data["categories"]);
          if (categories.isNotEmpty) {
            selectedCategory = categories[0];
            getCategoryData();
          }
        });
      } else {
        print('Failed to load categories');
      }
    } catch (e) {
      print(e);
    }
  }

  void getCategoryData() async {
    try {
      var response = await Dio().get(
        'http://10.0.2.2:4000/api/v1/product/all',
        queryParameters: {'category': selectedCategory},
      );

      if (response.statusCode == 200) {
        setState(() {
          jsonList = response.data["products"] as List;
        });
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).danhmuc),
        backgroundColor: Colors.white30,
      ),
      body: Container(
        color: Colors.pinkAccent,
        child: Column(
          children: [
            if (categories.isNotEmpty)
              CategoryList(
                categories: categories,
                selectedCategory: selectedCategory,
                onCategorySelected: (category) {
                  setState(() {
                    selectedCategory = category;
                    getCategoryData();
                  });
                },
              ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(16),
                itemCount: jsonList?.length ?? 0,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return itemGridView(index, jsonList, baseUrl);
                },
              ),
            ),
           
          ],
        ),
      ),
    );
  }

  Widget itemGridView(int index, List<dynamic>? jsonList, String baseUrl) {
    if (jsonList == null || index >= jsonList.length || jsonList[index] == null) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: Text(
            'No data available',
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      );
    }

    ProductModel product = ProductModel(
      id: jsonList[index]['id'],
      name: jsonList[index]['name'],
      price: jsonList[index]['price'],
      img: jsonList[index]['photo'],
      category: jsonList[index]['category'],
    );

    String imageUrl = baseUrl + jsonList[index]['photo'];
    bool hasInformation = product.name != null && product.name!.isNotEmpty;

    return GestureDetector(
      onTap: hasInformation ? () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(product: product),
          ),
        );
      } : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                product.name ?? 'Không có tên',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              NumberFormat('###,###,###').format(product.price) + ' VND',
              style: const TextStyle(fontSize: 15, color: Colors.red),
            ),
            IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: hasInformation ? () {
                Provider.of<CartModel>(context, listen: false).addItem(product);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Text('Sản phẩm đã được thêm vào giỏ hàng!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              } : null,
            ),
          ],
        ),
      ),
    );
  }
}
