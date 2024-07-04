import 'package:flutter/material.dart';
import 'package:widgets_image/constants/T_circular_imgaes.dart';
import 'package:widgets_image/constants/color.dart';
import 'package:widgets_image/settings.dart';
import 'package:widgets_image/utils/theme/custom_themes/profile_menu.dart';
import 'package:widgets_image/utils/theme/custom_themes/selection_heading.dart';

class EditProfilePage extends StatelessWidget {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColors.primary, //Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => SettingsPage()));
            },
          ),
        ],
      ),
    /*  body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Chỉnh sửa thông tin",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-RnWFzSpz13tXfFqeEE1UfNenLniz8ogHxg&s",
                              )),
                          ),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,                            
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Tên", "Khanh", false),
              buildTextField("Email", "khanh@gmail.com", false),
              buildTextField("Mật khẩu", "khanh", true),
              buildTextField("Địa chỉ", "BinhPhuoc", false),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    ),                  
                    onPressed: () {
                        Navigator.pop(context); 
                    },
                    child: Text("Hủy",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    ),                    
                    child: Text(
                      "Lưu",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),*/

      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,            ///Profile image
              child: Column(
              children: [
                TCircularImgaes(
                  image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-RnWFzSpz13tXfFqeEE1UfNenLniz8ogHxg&s',
                  width: 180,
                  height: 180,
                  isNetworkImage: true,
                  fit: BoxFit.cover
                 ),
                TextButton(onPressed: (){}, child: const Text('Thay đổi hình ảnh')),
              ],
            ),
          ),

              ///Details
              const SizedBox(height: 8.0),
              const Divider(),
              const SizedBox(height: 8.0),

              /// Phần đầu info
              const TSectionHeading(title: 'Thông tin cá nhân', showActionButton: false),
              const SizedBox(height: 8.0),

              TProfileMenu(onPressed: (){}, title: 'Tên', value: 'Cuong', fontSize: 21),
              TProfileMenu(onPressed: (){}, title: 'Tên người dùng', value: 'Cuong', fontSize: 21),
              
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              /// Heading ca nhan
              TProfileMenu(onPressed: (){}, title: 'User ID', value: '9999', fontSize: 21),
              TProfileMenu(onPressed: (){}, title: 'E-mail', value: 'Cuong@gmail.com', fontSize: 21),
              TProfileMenu(onPressed: (){}, title: 'SDT', value: '0389567456', fontSize: 21),
              TProfileMenu(onPressed: (){}, title: 'Giới tính', value: 'Nam', fontSize: 21),
              TProfileMenu(onPressed: (){}, title: 'Ngày sinh', value: '18/11/1987', fontSize: 21),
        ],
      ),
      ),
    ),








    );
  }

 /* Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }

  void setState(Null Function() param0) {}
  */
}
