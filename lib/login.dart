import 'package:flutter/material.dart';
import 'package:widgets_image/api/api_service.dart';
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/page/home.dart';
import 'package:widgets_image/global.dart' as globals;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool dark = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();
  bool _isLoading = false;
static Color _selectedColor = Colors.green;
  static Color _unSelectedColor = Colors.amber;

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



  void _toggleTheme() {
    setState(() {
      dark = !dark;
    });
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      final response = await _apiService.login(
        _emailController.text,
        _passwordController.text,
      );
      setState(() {
        _isLoading = false;
      });

      if (response.containsKey('error')) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(response['error'])),
        );
      } else {
         globals.loggedInEmail = _emailController.text;
        Navigator.pushReplacement(
          
          context,
          MaterialPageRoute(builder: (context) => MyHome()),
        );
      }
    }
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
                        translation(context).chaomungban,
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: dark ? Colors.white : TColors.dark,
                            ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        translation(context).thongbaokhuyenmai,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: dark ? Colors.white : TColors.dark,
                            ),
                      ),
                    ],
                  ),
     // Form
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _emailController,
                            focusNode: _emailTFFocusNode,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return translation(context).vuilongnhapvaoemail;
                              }
                              return null;
                            },
                            style: TextStyle(color: dark ? Colors.white : Colors.black ),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email, color: dark ? Colors.white : Colors.black),
                              labelText: translation(context).email,
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
                          TextFormField(
                            controller: _passwordController,
                              focusNode: _passwordTFFocusNode,

                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return translation(context).vuilongnhapvaomatkhau;
                              }
                              return null;
                            },
                            style: TextStyle(color: dark ? Colors.white : Colors.black),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: dark ? Colors.white : Colors.black),
                              labelText: translation(context).matkhau,
                              labelStyle: TextStyle(color: dark ? Colors.white : Colors.black),
                              suffixIcon: Icon(Icons.remove_red_eye),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: true,
                                    onChanged: (value) {},
                                    checkColor: dark ? TColors.black : Colors.white,
                                    activeColor: dark ? Colors.white : Colors.black,
                                  ),
                                  Text(
                                    translation(context).luumatkhaucuatoi,
                                    style: TextStyle(color: dark ? Colors.white : Colors.black),
                                  ),
                                ],
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  translation(context).quenpassword,
                                  style: TextStyle(color: dark ? Colors.white : Colors.black),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: _isLoading ? null : _login,
                              child: _isLoading ? CircularProgressIndicator() : Text(translation(context).dangnhap),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: dark ? Colors.grey[400] : TColors.white,
                                foregroundColor: dark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Text(translation(context).taotaikhoan),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: dark ? Colors.grey[400] : TColors.white,
                                foregroundColor: dark ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(height: 32.0),
                        ],
                      ),
                    ),
                  ),
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
