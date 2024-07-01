import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Thêm import này nếu chưa có
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/custom_shape/container/circurlar_container.dart';
import 'package:widgets_image/custom_shape/curved_edges/curved_edges.dart';
import 'package:widgets_image/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:widgets_image/login.dart';
import 'package:widgets_image/myorder.dart';
import 'package:widgets_image/orderpage.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/edit_profile.dart'; // Import trang EditProfilePage
import 'package:widgets_image/data/cart_model.dart';

import 'custom_shape/container/primary_header_cotainer.dart'; // Thêm import này nếu chưa có

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('Settings'),
      ),*/
      body:SingleChildScrollView(
       // Add padding for better spacing
        child: Column(
          /*mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,*/
          children: [ 
            TPrimaryContainerHeader(
              child: SizedBox(
                height: 200,
                width: 500,

              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 44.0),
                      child: Text(
                        'Cài đặt',
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .apply(color: TColors.white),
                      ),
                    ),
                  ],
                  
              ),
                
                /*alignment: Alignment.topLeft, // Align text to the left
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0), // Add padding
                child: Text(
                  'Tài Khoản',
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .apply(color: TColors.white),                    
                    ),  
                          
                ),*/
               //ListTile(
                //title: Text('Quản lí trang cá nhân của bạn', style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
               //),
              ),
            ),
            SizedBox(height: 10), // Add some space between the text and the icon
             /*Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Add onPressed functionality here
                },
                iconSize: 50, // Adjust the size of the icon as needed
              ),
            ),*/
            Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-RnWFzSpz13tXfFqeEE1UfNenLniz8ogHxg&s",
                              )),
                          ),
                    ),
            SizedBox(height: 20), // Add space between icon and account section
            Text(
              'Quản lí thông tin cá nhân',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Style for section title
            ),
            Divider(
              color: Colors.blueAccent, // Color of the underline
              thickness: 3, // Thickness of the underline
            ),

            //Tạo list danh sách cài đặt

            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Chỉnh sửa thông tin',
              style: TextStyle(
                  fontSize: 16, // Kích cỡ chữ lớn hơn
                  fontWeight: FontWeight.bold, // In đậm
                  ),
                ),        
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Đơn hàng của tôi',
              style: TextStyle(
                  fontSize: 16, // Kích cỡ chữ lớn hơn
                  fontWeight: FontWeight.bold, // In đậm
                  )
                ),
              onTap: () {
                // Lấy CartModel từ Provider và truyền vào OrderPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage(orderId: '',)),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Đăng xuất',
              style: TextStyle(
                  fontSize: 16, // Kích cỡ chữ lớn hơn
                  fontWeight: FontWeight.bold, // In đậm
                  )
                ),
              onTap: () {
                // Add navigation to cart page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
