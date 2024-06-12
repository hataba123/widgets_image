import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/cart.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/data/model.dart';
import 'package:widgets_image/login.dart';
import 'package:widgets_image/settings.dart';
import '../data/data.dart';
import '../config/const.dart';
import 'package:widgets_image/banner.dart';
import 'navbar.dart';
import 'package:widgets_image/productdetailpage.dart';
import 'theme_provider.dart';
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/category_list.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List<ProductModel> lstProduct = [];
  List<ProductModel> bestSellingProducts = [];
  List<ProductModel> newestProducts = [];
  List<ProductModel> discountedProducts = [];
  List<ProductModel> filteredProducts = [];
  bool isSearching = false;

  // categories
  List<String> categories = [];
  String? selectedCategory;
  String? selectedSortOrder;

  List<dynamic>? jsonList; // Sử dụng kiểu dữ liệu nullable
  final String baseUrl = 'http://10.0.2.2:4000/';

  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
    categorizeProducts();
    filteredProducts = lstProduct;
    fetchCategories();
    getData();
  }

  void categorizeProducts() {
    for (var product in lstProduct) {
      if (product.isBestSeller ?? false) {
        bestSellingProducts.add(product);
      }
      if (product.isNew ?? false) {
        newestProducts.add(product);
      }
      if (product.isDiscounted ?? false) {
        discountedProducts.add(product);
      }
    }
  }

  void updateSearch(String query) {
    setState(() {
      filteredProducts = lstProduct
          .where((product) =>
              product.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void fetchCategories() async {
    try {
      var response = await Dio().get('http://10.0.2.2:4000/api/v1/product/categories');
      if (response.statusCode == 200) {
        setState(() {
          categories = List<String>.from(response.data["categories"]);
        });
      } else {
        print('Failed to load categories');
      }
    } catch (e) {
      print(e);
    }
  }

  void getData() async {
    try {
      Map<String, dynamic> queryParameters = {
        if (selectedCategory != null) 'category': selectedCategory,
        if (selectedSortOrder != null) 'sort': selectedSortOrder,
      };

      var response = await Dio().get(
        'http://10.0.2.2:4000/api/v1/product/all',
        queryParameters: queryParameters,
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
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? TextField(
                decoration: InputDecoration(
                  hintText: 'Search products...',
                  border: InputBorder.none,
                ),
                onChanged: updateSearch,
              )
            : const Text("FortDenim", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue[700],
        actions: [
          IconButton(
            icon: Icon(isSearching ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                filteredProducts = lstProduct;
              });
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Trang chủ'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.brightness_6),
              title: Text('Chế độ sáng/tối'),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(value);
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Đăng xuất'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Giỏ hàng'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CartPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[100],
      body: Column(
        children: [
          BannerWidget(
            images: [
              ('assets/images/banner_1.jpg'),
                
             ('assets/images/banner_2.jpg'),
                  
            ],
          ),
          if (categories.isNotEmpty) CategoryList(categories: categories),
          DropdownButton<String>(
            hint: Text("Chọn danh mục"),
            value: selectedCategory,
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue;
                getData();
              });
            },
            items: categories.map<DropdownMenuItem<String>>((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
          ),
          DropdownButton<String>(
            hint: Text("Sắp xếp theo giá"),
            value: selectedSortOrder,
            onChanged: (String? newValue) {
              setState(() {
                selectedSortOrder = newValue;
                getData();
              });
            },
            items: [
              DropdownMenuItem<String>(
                value: 'asc',
                child: Text('Giá tăng dần'),
              ),
              DropdownMenuItem<String>(
                value: 'desc',
                child: Text('Giá giảm dần'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (!isSearching) ...[
                  buildProductSection("SẢN PHẨM BÁN CHẠY", bestSellingProducts),
                  const SizedBox(height: 16),
                  buildProductSection("SẢN PHẨM MỚI NHẤT", newestProducts),
                  const SizedBox(height: 16),
                  buildProductSection(
                      "SẢN PHẨM ĐANG GIẢM GIÁ", discountedProducts),
                ] else ...[
                  buildProductSection("KẾT QUẢ TÌM KIẾM", filteredProducts),
                ],
              ],
            ),
          ),
          NavBarWidget(),
        ],
      ),
    );
  }

  Widget buildProductSection(String title, List<ProductModel> products) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: TColors.info,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          alignment: Alignment.center,
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              // Kiểm tra nếu jsonList không bị null
              if (jsonList != null && jsonList!.isNotEmpty) {
                return itemGridView(index, jsonList!, baseUrl);
              } else {
                return Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
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
            },
          ),
        ),
      ],
    );
  }

  Widget itemGridView(int index, List<dynamic> jsonList, String baseUrl) {
    // Kiểm tra nếu jsonList là null hoặc không chứa phần tử tại chỉ số yêu cầu
    if (jsonList == null || index >= jsonList.length || jsonList[index] == null) {
      return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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

    // Tạo đối tượng ProductModel từ jsonList
    ProductModel product = ProductModel(
      id: jsonList[index]['id'],
      name: jsonList[index]['name'],
      price: jsonList[index]['price'],
      img: jsonList[index]['photo'],
      category: jsonList[index]['category']
      // Các thuộc tính khác nếu có
    );

    String imageUrl = baseUrl + jsonList[index]['photo'];

    // Kiểm tra nếu product không có thông tin cụ thể
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
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Image.network(
                imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8),
            Text(
              product.name ?? 'No name',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
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
