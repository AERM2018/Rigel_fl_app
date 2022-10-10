import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';
class ProductCategorySliderItem extends StatelessWidget {
  final ProductCategory category;
  final bool isSelected;
  const ProductCategorySliderItem({
    Key? key,
    required this.category, required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconContainer(color:(isSelected) ? Colors.amber : Colors.grey),
          const SizedBox(height: 10),
          Text(category.name)
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Color color;
  // Here would be the icon
  const IconContainer({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double circleHeight = 45;
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
                  color: color, shape: BoxShape.circle)),
        ),
        const Icon(Icons.alarm)
      ]),
    );
  }
}


