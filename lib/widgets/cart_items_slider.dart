import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/widgets/widgets.dart';

class CartItemsSlider extends StatelessWidget {
  const CartItemsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context, listen: true);
    print("cart items");
    print(cartProvider.cartItems);
    return ListView.builder(
      itemCount: cartProvider.cartItems.length,
      itemBuilder: (context,index) => CartItemsSliderItem(cartItem: cartProvider.cartItems[index])
    );
  }
}