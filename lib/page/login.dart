import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:widgets_image/constants/color.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
 // Giả định rằng biến `dark` được định nghĩa ở đây
    bool dark = true;
    return  Scaffold(
      body: SingleChildScrollView(child: Padding(padding: const EdgeInsets.only(
        top:56.0,
        left: 24.0,
        bottom: 24.0,
        right: 24.0,
      ),
      child: Column(
        children: [
          // Logo, Title and sub title
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                height: 150,
                image: AssetImage('assets/logos/logoapp.png'),
                ),
                  Text("CHÀO MỪNG BẠN",style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox( height: 8.0),
                  Text("Vô số mặt hàng và khuyến mãi đang đợi chờ bạn ",style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),

          // Form
          Form(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
            children: [
              TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email),
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            color: TColors.info,
                            width: 3.0,
                          ),
                ),
               ),
          ),
          const SizedBox(height: 16),
          
          //Email
          TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.lock),
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          borderSide: BorderSide(
                            color: TColors.info,
                            width: 3.0,
                          ), 
                ),
              ),
          ),
          const SizedBox(height: 8.0),

          //Remember me & Forgot password
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Remember me
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      const Text("Remember me"),
                    ],
                  ),

                  
                  // Forgot password
                    TextButton(onPressed: (){}, child: const Text("Forget password")),
                ],
              ),
             const SizedBox(height: 32.0),

            // Sign in button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Sign In"))),
            const SizedBox(height: 16.0),

            // create account button
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text("Create Account"))),
            const SizedBox(height: 32.0),
          ],
          ),),),

          // Divider
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(color: dark ? TColors.darkergrey: Colors.brown, thickness: 0.5, indent: 60, endIndent: 5),

          ],)
        ],
      ),
      ),),
    );
  }
}