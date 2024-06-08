import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgets_image/login.dart';
import 'package:animated_background/animated_background.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // Dùng Future.delayed để hiển thị Splash Screen trong 3 giây trước khi chuyển đến màn hình chính
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(), // Chuyển đến màn hình chính sau khi hoàn thành thời gian Splash Screen
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue, // Màu nền của Splash Screen
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMaxRadius: 50, // raduius of background object
            spawnMinSpeed: 15, // minimum speed of object moving
            particleCount: 70, // no of ohjects in background
            spawnMaxSpeed: 40,
            spawnOpacity: 0.3,
            baseColor: Colors.amber,
                image: Image(image: AssetImage("assets/logos/logoapp.png")),
              ),
            ),
            vsync: this,
            child: Container(),
          ),
         




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
