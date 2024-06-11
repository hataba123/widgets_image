import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widgets_image/data/cart_model.dart';
import 'package:widgets_image/page/splashscreen.dart';
import 'package:widgets_image/page/theme_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => CartModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'FortDenim',
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      home: SplashScreen(),
    );
  }
}
