import 'package:flutter/material.dart';
import 'package:widgets_image/stateful.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dùng Future.delayed để hiển thị Splash Screen trong 3 giây trước khi chuyển đến màn hình chính
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyStatefull(), // Chuyển đến màn hình chính sau khi hoàn thành thời gian Splash Screen
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Màu nền của Splash Screen
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Hình ảnh hoặc logo của ứng dụng
            FlutterLogo(size: 100),
            SizedBox(height: 20),
            // Tiêu đề hoặc thông điệp của Splash Screen
            Text(
              'Welcome to My App',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}