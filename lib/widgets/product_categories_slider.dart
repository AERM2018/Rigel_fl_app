import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/widgets/widgets.dart';


class ProductCategoriesSlider extends StatelessWidget {
  const ProductCategoriesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      child: Row(
        children: [
          SizedBox(
              width: screenWidth * 0.7,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, index) => GestureDetector(
                  onTap: () {
                    productProvider.setCategorySelected(productProvider.categories[index]);
                  },
                  child: ProductCategorySliderItem(
                    category: productProvider.categories[index],
                    isSelected: (productProvider.categories[index].id ==
                        productProvider.categorySelected?.id),
                  ),
                ),
                itemCount: productProvider.categories.length,
              )
            ),
          SizedBox(
            width: screenWidth * 0.2,
            child: IconButton(
              icon: Transform.scale(scale: 1.1 ,child: const Icon(Icons.search)),
              onPressed: () {
                print("button pressed!");
              },
            ),
          )
        ],
      ),
    );
  }

}
