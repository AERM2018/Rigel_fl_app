import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/product_preview_info.dart';

class ProductPreview extends StatelessWidget {
  const ProductPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    List<Product> products = productProvider.products;
      double circleHeight = 260;
      return Container(
        margin: const EdgeInsets.symmetric( vertical: 40),
        height: circleHeight,
        width: MediaQuery.of(context).size.width,
        child: (products.isNotEmpty) 
        ?
        Stack(alignment: AlignmentDirectional.center, children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
                height: circleHeight,
                decoration: BoxDecoration(
                    color: AppTheme.primaryColor, shape: BoxShape.circle)),
          ),
          const ProductPreviewInfo()
        ])
        : Center(
      child: Image.asset("assets/no-products-found.png"),
    )
      );
  }
}



