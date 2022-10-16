import 'package:flutter/material.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/add_to_car_cart.dart';
import 'package:rigel_app/widgets/cart_items_slider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
      ),
      backgroundColor: AppTheme.primaryColor,
      body: Stack(
        children: [
          Positioned(
            top: 100, left: 0, right: 0,
            child: Container(
              color: AppTheme.secondaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: MediaQuery.of(context).size.height -100,
              child: const CartItemsSlider()
            )
          ),
          const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AddToCarCart(
                isUpdatingQuantity: true,
              )),
        ],
      ),
    );
  }
}