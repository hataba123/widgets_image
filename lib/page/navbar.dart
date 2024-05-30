import 'package:flutter/material.dart';
import 'package:widgets_image/favouritelist.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/cart.dart';
import 'package:widgets_image/settings.dart';

class NavBarWidget extends StatelessWidget {




  
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(

      
    
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
           backgroundColor:   Colors.white ,
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            // Điều hướng đến trang Home khi nhấn vào mục Home
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHome()),
            );
            break;
          case 1:
            // Điều hướng đến trang Search khi nhấn vào mục Search
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FavoritesPage()),
            );
            break;
          case 2:
            // Điều hướng đến trang Favorites khi nhấn vào mục Favorites
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
            break;
          case 3:
            // Điều hướng đến trang Settings khi nhấn vào mục Settings
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsPage()),
            );
            break;
        }
      },
    );
  }
}
