import 'package:flutter/material.dart';
import 'package:widgets_image/login.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/edit_profile.dart';  // Import trang EditProfilePage


class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding for better spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Add some space between the text and the icon
             Align(
              alignment: Alignment.center,
              child: IconButton(
                icon: Icon(Icons.account_circle),
                onPressed: () {
                  // Add onPressed functionality here
                },
                iconSize: 50, // Adjust the size of the icon as needed
              ),
            ),
            SizedBox(height: 20), // Add space between icon and account section
            Text('Tài khoản',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold), // Style for section title
            ),
             Divider(
              color: Colors.black, // Color of the underline
              thickness: 1, // Thickness of the underline
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Chỉnh sửa thông tin'),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EditProfilePage()),    
                );       
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Giỏ Hàng'),
              onTap: () {
                // Add navigation to cart page
              },
            ),
             ListTile(
              leading: Icon(Icons.account_box),
              title: Text('Đăng xuất'),
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