import 'package:flutter/material.dart';

class TCircularImgaes extends StatelessWidget {
  const TCircularImgaes({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = const EdgeInsets.all(8.0),
    this.isNetworkImage = false,
    });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        // Nếu ảnh màu đằng sau là null thì chuyển nó thành đen và trắng theo thiết kế
        color: backgroundColor ?? (Theme.of(context).brightness == Brightness.dark ? Colors.black : Colors.white),
        shape: BoxShape.circle,
        
      ),
      child: ClipOval(
      child: Image(
        fit: fit,
        image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
        color: overlayColor,
        ),
      ),
    );
  }
}