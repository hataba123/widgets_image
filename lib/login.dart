import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}








class _LoginState extends State<Login> with TickerProviderStateMixin {

static Color _selectedColor = Colors.green;
  static Color _unSelectedColor = Colors.red;

  Color _emailTFColor = _unSelectedColor;
  Color _passwordColor = _unSelectedColor;

  FocusNode _emailTFFocusNode = FocusNode();
  FocusNode _passwordTFFocusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTFFocusNode.addListener(_onEmailTFFocusChange);
    _passwordTFFocusNode.addListener(_onPasswordTFFocusChange);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailTFFocusNode.removeListener(_onEmailTFFocusChange);
    _emailTFFocusNode.dispose();
    _passwordTFFocusNode.removeListener(_onPasswordTFFocusChange);
    _passwordTFFocusNode.dispose();
  }

  void _onEmailTFFocusChange() {
    setState(() {
      _emailTFFocusNode.hasFocus
          ? _emailTFColor = _selectedColor
          : _emailTFColor = _unSelectedColor;
    });
  }

  void _onPasswordTFFocusChange() {
    setState(() {
      _passwordTFFocusNode.hasFocus
          ? _passwordColor = _selectedColor
          : _passwordColor = _unSelectedColor;
    });
  }

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
       
      body: Stack(
        fit: StackFit.expand,
        children: [
          AnimatedBackground(
            behaviour: RandomParticleBehaviour(
              options: const ParticleOptions(
                spawnMinSpeed: 15, // minimum speed of object moving
            particleCount: 70, // no of ohjects in background
            spawnMaxSpeed: 40,
            spawnOpacity: 0.3,
            spawnMaxRadius: 40,
            baseColor: Colors.amber,
                image: Image(image: AssetImage("assets/logos/logoapp.png")),
              ),
            ),
            vsync: this,
            child: Container(),
          ),
          Padding(
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
                    const SizedBox(height: 34),
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        'ĐĂNG NHẬP',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),


                    
                    TextFormField(
                      
                      controller: _emailController,
                      focusNode: _emailTFFocusNode,
                      decoration:  InputDecoration(
                       labelStyle: TextStyle(color: _emailTFColor),
                      
                        labelText: "Email",
                      ),
                    ),






                    const SizedBox(height: 16),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                       focusNode: _passwordTFFocusNode,
                      decoration:  InputDecoration(
                         labelStyle: TextStyle(color:_passwordColor),
                        labelText: "Mật khẩu",
                      ),
                    ),
                    const SizedBox(height: 16),
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
                        const SizedBox(width: 16),
                        Expanded(
                          child: OutlinedButton(
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
