import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';

class ProductPreviewInfo extends StatelessWidget {
  const ProductPreviewInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    Product product = productProvider.productSelected;
    return Container(
      // color: Colors.pink,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Image.asset("assets/no-products-found.png")
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
                  unratedColor: Colors.white12,
                  itemSize: 15,
                  itemBuilder: (context, index) => const Icon(Icons.star, color:Colors.white), 
                  onRatingUpdate: (val){ print(val);}
                ),
                ElevatedButton(
                  onPressed: (){},
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