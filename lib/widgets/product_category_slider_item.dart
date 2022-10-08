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
    return Container(
      // color: Colors.red,
      width: 80,
      // height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
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
  const IconContainer({
    Key? key, required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.loose,
      alignment: AlignmentDirectional.bottomStart,
      children: [
      CustomPaint(painter: CirclePainter(radio: 22, offset: const Offset(12,-12), color: color)),
      const Icon(Icons.alarm)
    ]);
  }
}


