import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:widgets_image/data/model.dart';
import '../data/data.dart';
import '../config/const.dart';
import 'package:widgets_image/banner.dart';
import 'navbar.dart';
import 'package:widgets_image/productdetailpage.dart';
import 'package:widgets_image/category_list.dart';
class MyGrid extends StatefulWidget {
  const MyGrid({super.key});

  @override
  State<MyGrid> createState() => _MyGridState();
}
class _MyGridState extends State<MyGrid> {
  List<ProductModel> lstProduct = [];

  // categories
  List<String> categories = ['Áo', 'Quần', 'Phụ kiện', 'Giày',"Đồng hồ"];
  @override
  void initState() {
    super.initState();
    lstProduct = createDataList(10);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FortDenim"),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Xử lý sự kiện khi nhấn vào biểu tượng tìm kiếm ở đây
            },
          ),
        ],
      ),
      body: Column(
        children: [
          BannerWidget(
            images: [
              Image.asset('assets/images/banner_1.jpg', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
              Image.asset('assets/images/banner_2.jpg', width: MediaQuery.of(context).size.width, height: MediaQuery.of(context).size.height),
            ],
          ), // Add BannerWidget here
          CategoryList(categories: categories), // Use the CategoryList widget
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.center,
              child: GridView.builder(
                itemCount: lstProduct.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // set number column
                  childAspectRatio: 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Điều hướng đến trang chi tiết sản phẩm khi nhấn vào container
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
                            product: lstProduct[index],
                          ),
                        ),
                      );
                    },
                    child: itemGridView(lstProduct[index]),
                  );
                },
              ),
            ),
          ),
          NavBarWidget(), // Add NavBarWidget here
        ],
      ),
    );
  }
  // create subwidget
  Widget itemGridView(ProductModel productModel) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20), // Thiết lập BorderRadius
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
            style: const TextStyle(fontSize:15, fontWeight: FontWeight.bold,
          )),
          Text(
            NumberFormat('Price ###,###,###').format(productModel.price),
            style:const TextStyle(fontSize:15, color: Colors.red),
          ),
        ],
      ),
    );
  }  
}