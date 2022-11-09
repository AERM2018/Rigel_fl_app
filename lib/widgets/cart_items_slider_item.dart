import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/cart_model.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class CartItemsSliderItem extends StatelessWidget {
  final CartItemResponse cartItem;
  const CartItemsSliderItem({Key? key, required this.cartItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Dismissible(
      direction: DismissDirection.endToStart,
      background: const DismissibleBackground(),
      key: UniqueKey(),
      onDismissed: (direction) =>
          cartProvider.removeItem(cartProvider.cartItems.indexOf(cartItem)),
      child: GestureDetector(
        onTap: () => cartProvider.selectCartItem(cartItem),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              SizedBox(
                  width: 50,
                  child: (cartItem.product.images == null)
                      ? Image.asset(
                          "assets/pic-unavailable.png",
                          width: 20,
                          color: Colors.white,
                        )
                      : Image.network(
                          cartItem.product.images![0],
                          fit: BoxFit.cover,
                        )),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.product.title,
                        style: AppTheme.h2w,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "\$${cartItem.product.price}",
                        style: AppTheme.h3w,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "x${cartItem.quantity}",
                style: AppTheme.h2w,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DismissibleBackground extends StatelessWidget {
  const DismissibleBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text("Eliminar",
              style: TextStyle(
                fontFamily: AppTheme.h2boldw.fontFamily,
                fontSize: AppTheme.h2boldw.fontSize,
                color: Colors.red,
                fontWeight: AppTheme.h2boldw.fontWeight,
              )),
          const Icon(
            Icons.delete,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
