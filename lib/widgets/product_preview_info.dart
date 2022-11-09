import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/cart_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class ProductPreviewInfo extends StatelessWidget {
  const ProductPreviewInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    Product? product = productProvider.productSelected ?? productProvider.products[0];
    List<String> productImages = productProvider.temporalProductImages;
    const snackBar = SnackBar(
      content: Text('Item added to cart!'),
      duration: Duration(milliseconds: 1200),
    );
    return Container(
      // color: Colors.pink,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 150,
            child: (product.images == null)
            ? Image.asset(
                    "assets/pic-unavailable.png",
                    width: 20,
                  )
            :  Image.network(product.images![0],fit: BoxFit.cover,)
           
          ),
          Container(
            // color: Colors.green,
            width: 150,
            height: 150,
            margin: const EdgeInsets.only(left: 7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(product.title, style: AppTheme.h2boldw),
                Text("\$${product.price} MXN", style: AppTheme.h3w),
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: product.ranking!.toDouble(),
                  unratedColor: Colors.white12,
                  itemSize: 15,
                  itemBuilder: (context, index) => const Icon(Icons.star, color:Colors.white), 
                  onRatingUpdate: (val){}
                ),
                ElevatedButton(
                  onPressed: (){
                    cartProvider.addItem(productProvider.productSelected!, 1);
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: AppTheme.thirdColor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.shopping_cart_rounded, color: AppTheme.secondaryColor,),
                      const SizedBox(width: 10,),
                      Text("Add to cart", style: AppTheme.h4boldb,)
                    ],
                  )
                )
              ]
            ),
          )
        ]
      ),
    );
  }
}