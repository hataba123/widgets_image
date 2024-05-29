import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/data/model.dart';
import '../data/data.dart';
import '../config/const.dart';
import 'package:widgets_image/banner.dart';
import 'navbar.dart';
import 'package:widgets_image/productdetailpage.dart';
import 'package:widgets_image/category_list.dart';
import 'theme_provider.dart';


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
  List<String> categories = ['Áo', 'Quần', 'Phụ kiện', 'Giày', 'Đồng hồ'];

  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
    categorizeProducts();
    filteredProducts = lstProduct;
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
            : const 
            Text("FortDenim",style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
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
              leading: Icon(Icons.person),
              title: Text('Tài khoản'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Cài đặt'),
              onTap: () {
                // Handle your functionality here
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
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          CategoryList(categories: categories), // Use the CategoryList widget
          BannerWidget(
            images: [
              Image.asset('assets/images/banner_1.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height),
              Image.asset('assets/images/banner_2.jpg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height),
            ],
          ),
          CategoryList(categories: categories ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (!isSearching) ...[
                  buildProductSection("SẢN PHẨM BÁN CHẠY", bestSellingProducts),
                  const SizedBox(height: 16),
                  buildProductSection("SẢN PHẨM MỚI NHẤT", newestProducts),
                  const SizedBox(height: 16),
                  buildProductSection("SẢN PHẨM ĐANG GIẢM GIÁ",
                      discountedProducts),
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
            color: Colors.blue,
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
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ProductDetailPage(product: products[index]),
                    ),
                  );
                },
                child: itemGridView(products[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget itemGridView(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            url_img + productModel.img!,
            height: 78,
            width: 78,
            errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image),
          ),
          Text(
            productModel.name ?? '',
            textAlign: TextAlign.center,
            style: const
            TextStyle(fontSize: 15, 
            fontWeight: FontWeight.bold,
            color: Colors.black),
          ),
          Text(
            NumberFormat('Price ###,###,###').format(productModel.price),
            style: const TextStyle(fontSize: 15, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
