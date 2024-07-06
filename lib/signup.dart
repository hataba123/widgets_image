import 'package:flutter/material.dart';
import 'package:widgets_image/language/language_constants.dart';
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
                  child:  Text(
                    translation(context).dangky,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
                ),
                SizedBox(height:16),
                TextFormField(
                  controller: _nameController,
                  decoration:  InputDecoration(
                    labelText: translation(context).hovaten,
                  ),
                ),
                SizedBox(height:16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: translation(context).email,
                  ),
                ),                
                SizedBox(height:16),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: translation(context).sodienthoai,
                  ),
                ),
                SizedBox(height:16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: translation(context).matkhau,
                  ),
                ),
                SizedBox(height:16),
                TextFormField(
                  controller: _confirmpassController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: translation(context).xacnhanmatkhau,
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
                            MaterialPageRoute(builder: (context) => LoginScreen()),
                          );
                        },
                        child: Text(translation(context).trolaitrangdangnhap),
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
                      child:Text(translation(context).dangkybutton),
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