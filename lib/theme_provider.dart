import 'package:flutter/material.dart';
import 'package:widgets_image/constants/color.dart';



class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  // Thuộc tính màu chữ
  Color get textColor => isDarkMode ? TColors.white : TColors.black;
  Color get iconColor => isDarkMode ? TColors.white : TColors.black;
  Color get headingColor => isDarkMode ? TColors.white : TColors.black;
  Color get backgroundColor => isDarkMode ? TColors.grey2 : TColors.black;
  Color get colors => isDarkMode ? TColors.black : TColors.white;
  Color get bodyColor => isDarkMode ? TColors.grey2 : TColors.black;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

