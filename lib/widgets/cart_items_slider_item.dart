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
  const CartItemsSliderItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context, listen: false);
    return GestureDetector(
      onTap: () => cartProvider.selectCartItem(cartItem),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Row(
          children: [
            SizedBox(
              width: 50,
              child: Image.file(File(cartItem.productDetailed.images[0].path))
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cartItem.productDetailed.product.title, style: AppTheme.h2boldw,),
                    const SizedBox(height: 15),
                    Text("\$${cartItem.productDetailed.product.price}", style: AppTheme.h3w,),
                  ],
                ),
              ),
            ),
            Text("x${cartItem.quantity}",style: AppTheme.h2w,)
          ],
        ),
      ),
    );
  }
}