import 'package:flutter/material.dart';

import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
       padding: const EdgeInsets.fromLTRB(16, 0, 16, 36),
      
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,             
              children: [ 
                  Image.asset(
                    'assets/logos/logoapp.png', // Đường dẫn của hình ảnh
                    width: 200, // Độ rộng của hình ảnh (có thể điều chỉnh)
                    height: 200, // Độ cao của hình ảnh (có thể điều chỉnh)
                  ),
                  const SizedBox(
                  height: 34,
                ),
                Container(                  
                  alignment: Alignment.center,
                  child: const Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                ),
               
                const SizedBox(height:16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                  ),
                ),
                const SizedBox(height:16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Mật khẩu",
                  ),
                ),
                const SizedBox(height:16),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MyHome()),
                          );
                        },
                        child: const Text('Đăng nhập'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          );
                        },
                      child: const Text("Đăng ký"),
                    ),
                    ),  
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}