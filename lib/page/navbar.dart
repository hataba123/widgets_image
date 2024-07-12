import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/favouritelist.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/page/favorites_provider.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/cart.dart';
import 'package:widgets_image/page/theme_provider.dart';
import 'package:widgets_image/settings.dart';
import 'package:widgets_image/category_page.dart';
import 'package:iconsax/iconsax.dart';

class NavBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      showSelectedLabels: false,
      unselectedItemColor: Colors.black,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          backgroundColor: themeProvider.colors,
          icon: Icon(Iconsax.home, color: themeProvider.iconColor),
          label: translation(context).trangchu,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.category, color: themeProvider.iconColor),
          label: translation(context).danhmuc,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.shopping_cart, color: themeProvider.iconColor),
          label: translation(context).giohang,
        ),
        BottomNavigationBarItem(
          icon: Icon(Iconsax.setting, color: themeProvider.iconColor),
          label: translation(context).caidat,
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
            final favoritesProvider =
            Provider.of<FavoritesProvider>(context, listen: false);
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         FavoritesPage(favoriteProducts: favoritesProvider.favoriteProducts),
            //   ),
            // );
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CategoryPage()),
            );
            break;
          case 2:
            // Điều hướng đến trang Favorites khi nhấn vào mục Favorites
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CartPage()),
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
