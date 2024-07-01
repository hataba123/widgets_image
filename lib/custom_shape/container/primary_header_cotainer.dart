import 'package:flutter/material.dart';
import '../../constants/color.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circurlar_container.dart';


class TPrimaryContainerHeader extends StatelessWidget {
  const TPrimaryContainerHeader({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
            color: TColors.primary,
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Positioned(top:-150, right: -250, child: TCircularContainer(backgroundColor: TColors.textwhite.withOpacity(0.1),),),
                Positioned(top: 100, right: -100, child: TCircularContainer(backgroundColor: TColors.textwhite.withOpacity(0.1),),),
                child,          
              ],
            ),
          ),
    );
  }
}


