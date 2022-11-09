import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/add_to_cart_card.dart';
import 'package:rigel_app/widgets/capacity_square.dart';

class ProductFullInfo extends StatelessWidget {
  final Product product;
  const ProductFullInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider =
        Provider.of<ProductProvider>(context, listen: false);
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: screenWidth,
          height: 230,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: getProductImageWiget(product.images, screenWidth)),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            product.title,
            style: AppTheme.h1boldw,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.52,
                child: Text(
                  product.description,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.h4w,
                ),
              ),
              RatingBar.builder(
                  initialRating: product.ranking!.toDouble(),
                  unratedColor: Colors.white12,
                  itemSize: 20,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.white),
                  onRatingUpdate: (val) async {
                    await productProvider.rankProduct(val.toInt());
                    productProvider.selectProduct(product);
                  })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Text(
            "Capacity",
            style: AppTheme.h3boldw,
          ),
        ),
        SizedBox(
          width: screenWidth * 0.8,
          child: Row(
            children: [
              CapacitySquare(title: "Calories", data: product.calories),
              const SizedBox(
                width: 20,
              ),
              CapacitySquare(title: "Additives", data: product.additives),
              const SizedBox(
                width: 20,
              ),
              CapacitySquare(title: "Vitamins", data: product.vitamins),
            ],
          ),
        ),
      ]),
    );
  }

  getProductImageWiget(List<dynamic>? images, double screenWidth) {
    List<Widget> imageWidgets = [];
    for (var i = 0; i < 2; i++) {
      if (images == null) {
        imageWidgets.add(Image.asset(
          "assets/pic-unavailable.png",
          width: 100,
        ));
        break;
      } else {
        imageWidgets.add(Image.network(
          product.images![0],
          fit: BoxFit.cover,
          width: screenWidth * 0.42,
        ));
      }
    }
    return imageWidgets;
  }
}
