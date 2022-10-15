import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Stack(
        children:[
          ProductFullInfo(product: productProvider.productSelected! ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CartDisplayer(isMini: true)
          ),
          const Positioned(
            bottom: 70,
            left: 0,
            right: 0,
            child:  AddToCarCard()
          )
        ]
      ),
      backgroundColor: AppTheme.primaryColor,
    );
  }
}