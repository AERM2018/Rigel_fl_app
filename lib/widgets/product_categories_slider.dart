import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_categories_provider.dart';
import 'package:rigel_app/widgets/widgets.dart';


class ProductCategoriesSlider extends StatelessWidget {
  const ProductCategoriesSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productCategoriesProvider =
        Provider.of<ProductCategoriesProvider>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        SizedBox(
            width: screenWidth * 0.7,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, index) => GestureDetector(
                onTap: () => productCategoriesProvider.setCategorySelected(
                  productCategoriesProvider.categories[index]
                  ),
                child: ProductCategorySliderItem(
                  category: productCategoriesProvider.categories[index],
                  isSelected: (productCategoriesProvider.categories[index].id ==
                      productCategoriesProvider.categorySelected.id),
                ),
              ),
              itemCount: productCategoriesProvider.categories.length,
            )),
        SizedBox(
          width: screenWidth * 0.2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {

                  print("button pressed!");
                },
              ),
            ],
          ),
        )
      ],
    );
  }

}
