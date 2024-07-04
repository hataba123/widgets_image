import 'package:flutter/material.dart';


class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,  
    required this.onPressed,
    required this.title, 
    required this.value,
    this.icon = Icons.arrow_forward_ios,
    this.fontSize = 20.0,
    });
  
  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;
  final double fontSize;
 
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = TextStyle(
      fontSize: fontSize,
      color: Theme.of(context).textTheme.bodyLarge?.color,
    );
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 11),
        child: Row(
          children: [
            Expanded(flex: 5, child: Text(title, style: textStyle, overflow: TextOverflow.ellipsis)),
            Expanded(flex: 5, child: Text(value, style: textStyle, overflow: TextOverflow.ellipsis)),
            Expanded( child: Icon(icon, size: 18.0)),   
          ],
        ),
        ),
    );
  }
}