import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart'; // Thêm import này nếu chưa có
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/custom_shape/container/circurlar_container.dart';
import 'package:widgets_image/custom_shape/curved_edges/curved_edges.dart';
import 'package:widgets_image/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/login.dart';
import 'package:widgets_image/myorder.dart';
import 'package:widgets_image/orderpage.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/edit_profile.dart'; // Import trang EditProfilePage
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/page/theme_provider.dart';

import 'custom_shape/container/primary_header_cotainer.dart'; // Thêm import này nếu chưa có

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryContainerHeader(
              child: SizedBox(
                height: 220,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.0, vertical: 44.0),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back, color: themeProvider.iconColor),
                          ),
                          SizedBox(width: 10), // Khoảng cách giữa icon và text
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              translation(context).caidat,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineLarge!
                                  .apply(color: themeProvider.textColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
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
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              translation(context).quanlithongtincanhan,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Divider(
              color: Colors.blueAccent,
              thickness: 3,
            ),
            ListTile(
              leading: Icon(Iconsax.edit),
              title: Text(
                translation(context).chinhsuathongtin,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
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
              leading: Icon(Iconsax.receipt),
              title: Text(
                translation(context).donhangcuatoi,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyOrdersPage(orderId: '',)),
                );
              },
            ),
            ListTile(
              leading: Icon(Iconsax.logout),
              title: Text(
                translation(context).dangxuat,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
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
