import 'package:flutter/material.dart';

class TColors{
  

  TColors._();

  // APP basic color
  static const Color primary = Color(0xFF4B68FF);
  static const Color secondary = Color(0xFFFFE24B);
  static const Color accent = Color(0xFFb0c7ff);

  //GARDIAN COLOR
  static const Gradient linerGradient = LinearGradient(
    begin: Alignment(0.0 , 0.0),
    end: Alignment(0.707, -0.707),
    colors: [
      Color(0xffff9a9e),
      Color(0xfffad0c4),
      Color(0xfffad04c),
      ],
    );

  // Text Colors
  static const Color textprimary = Color(0xFF333333);
  static const Color textsecondary = Color(0xFF6C757D);
  static const Color textwhite = Colors.white;

  //Background color
  static const Color light = Color(0xFFF6F6F6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFF3F5FF);

  //Background container colors
  static const Color lightContainer = Color(0xFFF6F6F6);
  static  Color darkContainer = TColors.white.withOpacity(0.1);

  //Button colors
  static const Color buttonprimary = Color(0xFF4B68FF);
  static const Color buttonsecondary = Color(0xFF6C757D);
  static const Color buttondisable = Color(0xFFC4C4C4);

  //Border colors
  static const Color borderprimary = Color(0xFFD9D9D9);
  static const Color Bodersecondary = Color(0xFFE6E6E6);

  //EROR VALIDATION COLOR
  static const Color error = Color(0xFFD32F2F);
  static const Color  success = Color(0xFF388E3C);
  static const Color warning = Color(0xFFF57C00);
  static const Color info = Color.fromARGB(255, 25, 50, 210);

  //Nautral shades
  static const Color black = Color(0xFF232323);
  static const Color darkergrey = Color(0xFF4F4F4F);
  static const Color darkgrey = Color(0xFF939393);
  static const Color grey = Color(0xFFE0E0E0);
  static const Color  softgrey = Color(0xFFF4F4F4);
  static const Color lightgrey = Color(0xFFF9F9F9);
  static const Color white = Color(0xFFFFFFFF);
  
}   