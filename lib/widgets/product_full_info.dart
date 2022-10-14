import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/themes/app_theme.dart';

class ProductFullInfo extends StatelessWidget {
  final ProductDetailed product;
  const ProductFullInfo({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          width: screenWidth,
          height: 250,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.file(
              File(product.images[0].path),
              fit: BoxFit.cover,
            ),
            Image.file(
              File(product.images[0].path),
              fit: BoxFit.cover,
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            product.product.title,
            style: AppTheme.h1boldw,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.52,
                child: Text(
                  product.product.description,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.h4w,
                ),
              ),
              RatingBar.builder(
                  unratedColor: Colors.white12,
                  itemSize: 20,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.white),
                  onRatingUpdate: (val) {
                    print(val);
                  })
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Text(
            "Capacity",
            style: AppTheme.h3boldw,
          ),
        )
      ]),
    );
  }
}
