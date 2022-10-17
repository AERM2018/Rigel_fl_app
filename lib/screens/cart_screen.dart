import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/add_to_cart_card.dart';
import 'package:rigel_app/widgets/cart_items_slider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primaryColor,
        elevation: 0,
      ),
      backgroundColor: AppTheme.primaryColor,
      body: 
      cartProvider.cartItems.isNotEmpty
      ?
      Stack(
        children: [
          Positioned(
            top: 100, left: 0, right: 0,
            child: Container(
              color: AppTheme.secondaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              height: MediaQuery.of(context).size.height -100,
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    margin: const EdgeInsets.only(bottom: 20),
                    child: const CartItemsSlider()
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${cartProvider.cartItems.length} ${cartProvider.cartItems.length > 1 ? "items" : "item"}",
                          style: AppTheme.h3w,
                        ),
                        const CartTotal()
                      ],
                    ),
                  )
                ],
              )
            )
          ),
          const Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AddToCartCard(
                isUpdatingQuantity: true,
              )),
        ],
      )
      : 
      Transform.scale(scale: 1.8,child: Center(child: Image.asset("assets/empty-cart.png"),))
    );
  }
}

class CartTotal extends StatelessWidget {
  const CartTotal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10));
    return SizedBox(
      width: 170,
      height: 40,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children:  [
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: Container(
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.primaryColorLighter, width: 1.3),
              borderRadius: const BorderRadius.all(Radius.circular(10))
            ),
            child: Center(child: Text("\$${cartProvider.total}", style: AppTheme.h3w)),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          bottom: 0,
          child: ElevatedButton(
            onPressed: (){}, 
            style: ElevatedButton.styleFrom(
              primary: AppTheme.primaryColorLighter,
              shape: RoundedRectangleBorder(borderRadius: borderRadius)
            ),
            child: Text("Buy now", style: AppTheme.h4b), 
          )
        )
      ],)
    );
  }
}