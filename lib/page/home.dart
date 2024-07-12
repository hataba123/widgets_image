import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/cart.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/data/model.dart';
import 'package:widgets_image/favouritelist.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/login.dart';
import 'package:widgets_image/main.dart';
import 'package:widgets_image/product_card.dart';
import 'package:widgets_image/settings.dart';
import '../data/data.dart';
import '../config/const.dart';
import 'package:widgets_image/banner.dart';
import 'navbar.dart';
import 'package:widgets_image/productdetailpage.dart';
import 'theme_provider.dart';
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/category_list.dart';
import 'package:widgets_image/global.dart' as globals;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:widgets_image/language/language.dart';
import 'package:image_picker/image_picker.dart';

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
  List<ProductModel> favoriteProducts = [];
  bool isSearching = false;
  bool isFavorite = false;

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
    favoriteProducts = lstProduct.where((product) => product.isFavorite).toList();
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
       if (product.isFavorite) {
        favoriteProducts.add(product);
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
          if (categories.isNotEmpty) {
            selectedCategory = categories[0];
            getData();
          }
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
  void _pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      // Xử lý khi đã chọn được ảnh, ví dụ: lưu đường dẫn ảnh vào biến hoặc hiển thị ảnh lên giao diện
      String imagePath = pickedFile.path;
      // Tiếp tục xử lý ảnh như lưu vào biến, hiển thị lên UI, ...
    } else {
      // Xử lý khi không chọn được ảnh
      print('Không chọn được ảnh từ thư viện');
    }
  }
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
              color: themeProvider.bodyColor, // Sử dụng màu nền từ ThemeProvider
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.blue, Colors.purple],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),
          child: AppBar(
            title: isSearching
                ? TextField(
                    decoration: const InputDecoration(
                      hintText: 'Search products...',
                      border: InputBorder.none,
                    ),
                    onChanged: updateSearch,
                  )
                : Text("", style: TextStyle(color: themeProvider.textColor),),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                icon: Icon(Iconsax.camera),
                onPressed: () {
                  _pickImageFromGallery(); // Gọi hàm để chọn ảnh từ thư viện ảnh của thiết bị
                },
                ),
              IconButton(
                icon: Icon(isSearching ? Icons.close : Iconsax.search_normal),
                onPressed: () {
                  setState(() {
                    isSearching = !isSearching;
                    filteredProducts = lstProduct;
                  });
                },
              ),
              IconButton(
            icon: Icon(Iconsax.heart),
            onPressed: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage(favoriteProducts: favoriteProducts)),
                );
              });
            },
            ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: Container(
            color: themeProvider.bodyColor, // Sử dụng màu nền từ ThemeProvider
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [Colors.lightBlue[100]!, Colors.purple],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration:  BoxDecoration(
                  color: themeProvider.bodyColor,
                ),
                accountName: Center( 
                  child:  Text(
                  'User',
                  style: TextStyle(
                    color: themeProvider.textColor,
                    fontSize: 24,
                    ),
                  ),
                ),
                accountEmail: Text(
                  globals.loggedInEmail,
                  style: TextStyle(
                    color: themeProvider.textColor,
                    fontSize: 18,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Iconsax.home),
                title: Text(translation(context).trangchu),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Iconsax.settings),
                title: Text(translation(context).caidat),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsPage()),
                  );
                },
              ),
              ListTile(
              leading: const Icon(Iconsax.moon),
              title: Text(
                translation(context).chedosangtoi,
              ),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (value) {
                  themeProvider.toggleTheme(!value);
                },
              ),
              ),
              ListTile(
              leading: Icon(Iconsax.global),
              title: Text(translation(context).ngonngu),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return ListView(
                      shrinkWrap: true,
                      children: Language.languageList()
                          .map<Widget>((language) => ListTile(
                                leading: Text(
                                  language.flag,
                                  style: TextStyle(fontSize: 30),
                                ),
                                title: Text(language.name),
                                onTap: () async {
                                  Locale _locale = await setLocale(language.languageCode);
                                  MyApp.setLocale(context, _locale);
                                  Navigator.pop(context); // Đóng modal
                                },
                              ))
                          .toList(),
                    );
                  },
                );
              },
            ),
              ListTile(
                leading: Icon(Iconsax.logout),
                title: Text(translation(context).dangxuat),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
              ),
              ListTile(
                leading: Icon(Iconsax.shopping_cart),
                title: Text(translation(context).giohang),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartPage()),
                  );
                },
              ),
                  ListTile(
                leading: Icon(Iconsax.heart),
                title: Text(translation(context).yeuthich),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesPage(favoriteProducts: favoriteProducts)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
          color: themeProvider.backgroundColor, // Sử dụng màu nền từ ThemeProvider
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     colors: [Colors.lightBlue[100]!, Colors.purple!],
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //   ),
        // ),
        child: Column(
          children: [
            SizedBox(height: 10), // Adjust the height as needed
            BannerWidget(
              images: [
                'assets/images/banner_1.jpg',
                'assets/images/banner_2.jpg',
              ],
            ),
          //   ListView(
          //   scrollDirection: Axis.horizontal,
          //   children: [
          //     ProductCard(image: 'assets/images/product_1.jpg', name: 'Product 1', price: 29.99),
          //     ProductCard(image: 'assets/images/product_2.jpg', name: 'Product 2', price: 19.99),
          //     ProductCard(image: 'assets/images/product_3.jpg', name: 'Product 3', price: 39.99),
          //   ],
          // ),
          if (categories.isNotEmpty)
            CategoryList(
              categories: categories,
              selectedCategory: selectedCategory,
              onCategorySelected: (category) {
                setState(() {
                  selectedCategory = category;
                  getData();
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButton<String>(
                      icon: Icon(Icons.arrow_drop_down),
                      isExpanded: false,
                      hint: Text(translation(context).sapxeptheogia),
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
                          child: Text(translation(context).giatangdan),
                        ),
                        DropdownMenuItem<String>(
                          value: 'desc',
                          child: Text(translation(context).giagiamdan),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding:  EdgeInsets.all(16),
                children: [
                  if (!isSearching) ...[
                    buildProductSection(translation(context).spbanchay, bestSellingProducts),
                     SizedBox(height: 16),
                    buildProductSection(translation(context).spmoinhat, newestProducts),
                     SizedBox(height: 16),
                    buildProductSection(
                        translation(context).spgiamgia, discountedProducts),
                  ] else ...[
                    buildProductSection(translation(context).ketquatimkiem, filteredProducts),
                  ],
                ],
              ),
            ),
            NavBarWidget(),
          ],
        ),
      ),
    );
  }

  Widget buildProductSection(String title, List<ProductModel> products) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: themeProvider.headingColor,
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
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (BuildContext context, int index) {
              return itemGridView(index, jsonList, baseUrl);
            },
          ),
        ),
      ],
    );
  }

  Widget itemGridView(int index, List<dynamic>? jsonList, String baseUrl) {
    // Kiểm tra nếu jsonList là null hoặc không chứa phần tử tại chỉ số yêu cầu
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