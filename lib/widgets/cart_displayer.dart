import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';

class CartDisplayer extends StatelessWidget {
  final bool isMini;
  const CartDisplayer({Key? key, required this.isMini}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      height: isMini ? 100 : MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: AppTheme.secondaryColor
      ),
      child: Column(
      mainAxisAlignment: isMini ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical:25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform.scale(scale: 1.5,child: Icon(Icons.shopping_bag_outlined, color: AppTheme.thirdColor,)),
                    const SizedBox(width: 20),
                    Text("Cart", style: AppTheme.h3w,)
                  ],
                ),
                isMini ? const ItemCounterContainer() : const SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ItemCounterContainer extends StatelessWidget {
  const ItemCounterContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double circleHeight = 30;
    return SizedBox(
      height: circleHeight,
      width: circleHeight,
      child: Stack(alignment: AlignmentDirectional.center, children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
              height: circleHeight,
              decoration: BoxDecoration(
                  color: AppTheme.thirdColor, shape: BoxShape.circle)),
        ),
       Text("2", style: AppTheme.h2boldb,)
      ]),
    );
  }
}