import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_categories_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class ProductsSliderItem extends StatelessWidget {
    final Product product;

  const ProductsSliderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    bool isSelected = product.id == productProvider.productSelected?.id;
    return GestureDetector(
      onTap: () => productProvider.selectProduct(product),
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductImageContainer(color: isSelected ? AppTheme.primaryColor : AppTheme.disable, productImagePath: ""),
            Text(product.title)
          ],
        ),
      ),
    );
  }
}


class ProductImageContainer extends StatelessWidget {
  final Color color;
  final String productImagePath;
  const ProductImageContainer({
    Key? key,
    required this.color, required this.productImagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double circleHeight = 60;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: circleHeight,
      width: circleHeight,
      child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(height: circleHeight,decoration: const BoxDecoration(color: Colors.grey, shape: BoxShape.circle)),
            ),
            const Icon(Icons.no_photography_rounded)
          ]),
    );
  }
}
