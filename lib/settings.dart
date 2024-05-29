import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        automaticallyImplyLeading: false
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start ,
          children: [
            Text('This is the Settings Page'),
            SizedBox(height: 20), // Add some space between the text and the icon
            IconButton(
              icon: Icon(Icons.account_circle), // Add account icon here
              onPressed: () {
                // Add onPressed functionality here
              },
              iconSize: 50, // Adjust the size of the icon as needed
            ),
          ],
        ),
      ),
    );
  }
}
