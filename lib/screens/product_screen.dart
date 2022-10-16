import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    bool isCartEmpty = cartProvider.cartItems.isEmpty;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Stack(
        children:[
          ProductFullInfo(product: productProvider.productSelected! ),
          if ( !isCartEmpty ) ...[const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CartDisplayer(isMini: true)
          )],
          Positioned(
            bottom: (!isCartEmpty) ? 70 : 0,
            left: 0,
            right: 0,
            child:  const AddToCarCart(isUpdatingQuantity: false,)
          )
        ]
      ),
      backgroundColor: AppTheme.primaryColor,
    );
  }
}