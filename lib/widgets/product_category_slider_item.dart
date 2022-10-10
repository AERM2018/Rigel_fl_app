import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/themes/app_theme.dart';
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
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconContainer(color:(isSelected) ? AppTheme.primaryColorLighter : AppTheme.disable, isSelected: isSelected,),
          const SizedBox(height: 15),
          Text(category.name, style:TextStyle(
            fontSize:  AppTheme.h4boldb.fontSize, 
            color: (isSelected) ? AppTheme.h4boldb.color : AppTheme.disable,
            fontWeight:  AppTheme.h4boldb.fontWeight
            ))
        ],
      ),
    );
  }
}

class IconContainer extends StatelessWidget {
  final Color color;
  final bool isSelected;
  // Here would be the icon
  const IconContainer({
    Key? key,
    required this.color, required this.isSelected,
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
        Icon(Icons.alarm, color: isSelected ? AppTheme.secondaryColor : AppTheme.disableDark)
      ]),
    );
  }
}


