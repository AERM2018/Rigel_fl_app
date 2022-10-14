import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/widgets/widgets.dart';

class ProductsDisplayer extends StatelessWidget {
  const ProductsDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(top: 12),
      width: screenSize.width,
      height: screenSize.height * 0.13,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const ProductsSlider(),
          Container(
            width: screenSize.width * 0.15,
            child: IconButton(
              onPressed: () => Navigator.pushNamed(context, "newProduct"),
              icon: Transform.scale(
                scale: 1.5,
                child: Icon(Icons.add_circle_rounded, color: Colors.grey.shade300, size: 35,))),
          )
        ],
      ),
    );
  }
}