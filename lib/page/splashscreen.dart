import 'package:flutter/material.dart';
import 'package:widgets_image/login.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dùng Future.delayed để hiển thị Splash Screen trong 3 giây trước khi chuyển đến màn hình chính
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(), // Chuyển đến màn hình chính sau khi hoàn thành thời gian Splash Screen
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.lightBlue, // Màu nền của Splash Screen
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/logos/logoapp.png', // Đường dẫn của hình ảnh
                  width: 200, // Độ rộng của hình ảnh (có thể điều chỉnh)
                  height: 200, // Độ cao của hình ảnh (có thể điều chỉnh)
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -50, // Đặt bottom thành 0 để đặt hình ảnh ở dưới cùng của màn hình
            child: Image.asset(
              'assets/logos/shoppingsplash.png', // Đường dẫn của hình ảnh ở đáy
              width: 200, // Độ rộng của hình ảnh (có thể điều chỉnh)
              height: 150, // Độ cao của hình ảnh (có thể điều chỉnh)
            ),
          ),
        ],
      ),
    );
  }
}