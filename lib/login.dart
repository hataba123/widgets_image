import 'package:flutter/material.dart';

import 'package:widgets_image/page/home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _checkvalue_1 = false;
  bool _checkvalue_2 = false;
  bool _checkvalue_3 = false;
  int _gender = 0;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassController = TextEditingController();
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
                ),const SizedBox(height:16),
                
                const SizedBox(height:16),


                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>MyHome()),
                          );
                        },
                        child: const Text('Đăng nhập'),
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(child: ElevatedButton(
                      onPressed: (){
                        var fullName = _nameController.text;
                        showDialog(context: context, builder: (context){
                          return AlertDialog(
                            content: Text("Fullname: $fullName"),
                            // lay tiep tuc cac gia tri con lai
                          );
                        },
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