import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:widgets_image/constants/T_circular_imgaes.dart';
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/language/language_constants.dart';
import 'package:widgets_image/settings.dart';
import 'package:widgets_image/utils/theme/custom_themes/profile_menu.dart';
import 'package:widgets_image/utils/theme/custom_themes/selection_heading.dart';
import 'page/theme_provider.dart';
import 'package:widgets_image/login.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController sdtController = TextEditingController();
  final TextEditingController gioitinhController = TextEditingController();
  final TextEditingController ngaysinhController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  bool showPassword = false;
  File? _image;
  String? _imagePath; 

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _imagePath = prefs.getString('profile_image');
      if (_imagePath != null) {
        _image = File(_imagePath!);
      }
    });
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imagePath = pickedFile.path;
      });
      final prefs = await SharedPreferences.getInstance();
      prefs.setString('profile_image', pickedFile.path);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    nameController.dispose();
    userIdController.dispose();
    emailController.dispose();
    sdtController.dispose();
    gioitinhController.dispose();
    ngaysinhController.dispose();
    // Dispose FocusNodes
    emailFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: themeProvider.iconColor,
          ),
          onPressed: () {
Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: themeProvider.iconColor,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 90,
                            backgroundImage: FileImage(_image!),
                          )
                        : const TCircularImgaes(
                            image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-RnWFzSpz13tXfFqeEE1UfNenLniz8ogHxg&s',
                            width: 180,
                            height: 180,
                            isNetworkImage: true,
                            fit: BoxFit.cover,
                          ),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text(
                        'Thay đổi hình ảnh',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              // Details
              const SizedBox(height: 8.0),
              const Divider(thickness: 4),
              const SizedBox(height: 8.0),

              // Personal Info Heading
              TSectionHeading(
                title: translation(context).thongtincanhan,
                textColor: TColors.primary,
                showActionButton: false,
              ),
              const SizedBox(height: 8.0),

              TProfileMenu(
                onPressed: () {},
                title: translation(context).ten,
                value: 'Cuong',
                fontSize: 21,
              ),
              TProfileMenu(
                onPressed: () {},
                title: translation(context).tennguoidung,
                value: 'Cuong', fontSize: 21,
                  ),

              const SizedBox(height: 16),
              const Divider(thickness: 4),
              const SizedBox(height: 16),

              // User Info Heading
              TSectionHeading(
                title: translation(context).thongtinnguoidung,
                textColor: TColors.primary,
                showActionButton: false,
              ),
              const SizedBox(height: 16),

              TProfileMenu(
                onPressed: () {},
                title: translation(context).tennguoidung,
child: TextFormField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: translation(context).tennguoidung,
                  ),
                ),
                fontSize: 21,
              ),
              const SizedBox(height: 16),
              const Divider(thickness: 4),
              const SizedBox(height: 16),
              TSectionHeading(
                title: translation(context).thongtinnguoidung,
                textColor: TColors.primary,
                showActionButton: false,
              ),
              const SizedBox(height: 16),
              TProfileMenu(
                onPressed: () {},
                title: translation(context).userid,
                value: '9999', icon: Icons.copy, fontSize: 21
              ),
              TProfileMenu(
                onPressed: () {
                  FocusScope.of(context).requestFocus(emailFocusNode); // Use the specific FocusNode
                },
                title: translation(context).email,
                value: 'Cuong@gmail.com', fontSize: 21                
              ),
              TProfileMenu(
                onPressed: () {},
                title: translation(context).sdt,
                value: '0398564759',                
                fontSize: 21,
              ),
              TProfileMenu(
                onPressed: () {},
                title: translation(context).gioitinh,
                value: 'Nam', fontSize: 21
              ),
              TProfileMenu(
                onPressed: () {},
                title: translation(context).ngaysinh,
                value: '18/11/1987', fontSize: 21,
              ),
              const SizedBox(height: 8),
              const Divider(thickness: 4),
              const SizedBox(height: 8),

              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
                },
                  child: Text(
                    translation(context).dongtaikhoan,
                    style: TextStyle(color: TColors.error, fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
