import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class ProductPreview extends StatelessWidget {
  final Product? product;
  const ProductPreview({Key? key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(product != null){

    }
    return Center(
      child: Image.asset("assets/no-products-found.png"),
    );
  }
}