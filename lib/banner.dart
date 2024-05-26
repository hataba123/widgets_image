import 'package:flutter/material.dart';

class BannerWidget extends StatelessWidget {
  final List<Image> images;

  const BannerWidget({required this.images, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,  
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: images.map((image) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: image,
          );
        }).toList(),
      ),
    );
  }
}
