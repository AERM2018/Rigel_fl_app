import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class ProductsSliderItem extends StatelessWidget {
    final Product product;

  const ProductsSliderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    // List<String> productImages = productProvider.productImages;d
    bool isSelected = product.id == productProvider.productSelected?.id;
    return GestureDetector(
      onTap: () => productProvider.selectProduct(product),
      onDoubleTap: () {
        if( !isSelected ){
          productProvider.selectProduct(product);
        }
        Navigator.pushNamed(context, "product");
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ProductImageContainer(isSelected:isSelected, productImagePath: product.images!.isNotEmpty ? product.images![0] : ""),
            Text(product.title)
          ],
        ),
      ),
    );
  }
}


class ProductImageContainer extends StatelessWidget {
  final bool isSelected;
  final String productImagePath;
  const ProductImageContainer({
    Key? key,
required this.productImagePath, required this.isSelected,
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
              child: Container(height: circleHeight,decoration:  BoxDecoration(color:  isSelected ? AppTheme.primaryColor : AppTheme.disable, shape: BoxShape.circle)),
            ),
            Transform.scale(
              scale:  isSelected ? 1.5 : 1,
              child: Image.network(
                      productImagePath,
                      fit: BoxFit.cover,
                    ),
            )
          ]),
    );
  }
}
