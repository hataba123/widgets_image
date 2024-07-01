import 'package:flutter/material.dart';

import '../../constants/color.dart';
class TCircularContainer extends StatelessWidget {
  const TCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.raduius = 400,
    this.padding = 0,
    this.backgroundColor = TColors.white,
  });

    final double? width;
    final double? height;
    final double raduius;
    final double padding;
    final Widget? child;
    final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding:  EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(raduius),
        color: backgroundColor,
        ),
        child: child,
    );
  }
}
