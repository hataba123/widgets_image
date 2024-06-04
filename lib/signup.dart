import 'package:flutter/material.dart';
import 'package:widgets_image/login.dart';

import 'package:widgets_image/page/home.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {  
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
  final _phoneController = TextEditingController();
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
                    'ĐĂNG KÝ',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                ),
                const SizedBox(height:16),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Họ và tên",
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
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: "Số điện thoại",
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
                TextFormField(
                  controller: _confirmpassController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: "Xác nhận mật khẩu",
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
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        },
                        child: const Text('Trở lại trang Đăng nhập'),
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