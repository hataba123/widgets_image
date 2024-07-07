import 'package:flutter/material.dart';


class TProfileMenu extends StatelessWidget {
  const TProfileMenu({
    super.key,  
    required this.onPressed,
    required this.title, 
    this.value,
    this.child,
    this.icon = Icons.arrow_forward_ios,
    this.fontSize = 20.0,
    });
  final IconData icon;
  final VoidCallback onPressed;
  final String title;
  final String? value;
  final double fontSize;
  final Widget? child; // Thêm thuộc tính child

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
            Expanded( child: Icon(icon, size: 18.0)),   
          ],
        ),
        ),
    );
  }
}