/*import 'package:flutter/material.dart';

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
}*/
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_image/constants/color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool dark = true;

  void _toggleTheme() {
    setState(() {
      dark = !dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark ? TColors.black : Colors.lightBlue[100],
      
      body: Stack(
        children: [
              
      SingleChildScrollView(
        
        child: Padding(
          
          padding: const EdgeInsets.only(
            top: 56.0,
            left: 24.0,
            bottom: 24.0,
            right: 24.0,
          ),
          
          child: Column(
            
            children: [
               Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.wb_sunny, color: dark ? Colors.white : Colors.black),
              onPressed: _toggleTheme,
            ),
          ),
              // Logo, Title and sub title
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          

                  const Center(
                    child: Image(
                      height: 150,
                      image: AssetImage('assets/logos/logoapp.png'),
                    ),
                  ),
                  Text(
                    "CHÀO MỪNG BẠN",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: dark ? Colors.white : TColors.dark,
                        ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "Vô số mặt hàng và khuyến mãi đang đợi chờ bạn ",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: dark ? Colors.white : TColors.dark,
                        ),
                  ),
                ],
              ),

              // Form
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: dark ? Colors.white : Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email, color: dark ? Colors.white : Colors.black),
                          labelText: "Email",
                          labelStyle: TextStyle(color: dark ? Colors.white : Colors.black),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            borderSide: BorderSide(
                              color: TColors.info,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Password
                      TextFormField(
                        style: TextStyle(color: dark ? Colors.white : Colors.black),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock, color: dark ? Colors.white : Colors.black),
                          labelText: "Password",
                          labelStyle: TextStyle(color: dark ? Colors.white : Colors.black),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(9.0)),
                            borderSide: BorderSide(
                              color: TColors.info,
                              width: 3.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),

                      // Remember me & Forgot password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Remember me
                          Row(
                            children: [
                              Checkbox(
                                value: true,
                                onChanged: (value) {},
                                checkColor: dark ? TColors.black : Colors.white,
                                activeColor: dark ? Colors.white : Colors.black,
                              ),
                              Text(
                                "Lưu mật khẩu của tôi",
                                style: TextStyle(color: dark ? Colors.white : Colors.black),
                              ),
                            ],
                          ),

                          // Forgot password
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Quên password",
                              style: TextStyle(color: dark ? Colors.white : Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 32.0),

                      // Sign in button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Đăng nhập"),
                          style: ElevatedButton.styleFrom(
                           backgroundColor: dark ? Colors.grey[400] : TColors.white,
                           foregroundColor: dark ? Colors.white : Colors.black
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      // Create account button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text("Tạo tài khoản"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: dark ? Colors.grey[400] : TColors.white,
                            foregroundColor: dark ? Colors.white : Colors.black
                          ),
                        ),
                      ),
                      const SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
              // Toggle theme button
             
  
              // Divider
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Divider(
                      color: dark ? TColors.darkergrey : TColors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                ],
              ),    
                
            ],
          ),
        ),
      ),
        ],     
      ),
    );
  }
}
