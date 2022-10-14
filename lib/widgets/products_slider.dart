import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';
class ProductsSlider extends StatelessWidget {
  const ProductsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductProvider productsProvider = Provider.of<ProductProvider>(context);
    // productsProvider.getProducts(categoryId: productsProvider.categorySelected?.id);
    print("objects");
    print(productsProvider.productsDetailed);
    double widthModifier = productsProvider.productsDetailed.length >= 4 ? 0.25 * 3 : 0.25 * productsProvider.productsDetailed.length;
    // return (productsProvider.categorySelected == null )
    // ? CircularProgressIndicator(color: AppTheme.primaryColor
    return SizedBox(
      width: MediaQuery.of(context).size.width * widthModifier,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width:  MediaQuery.of(context).size.width * 0.25,
          // color: Colors.amber,
          child: ProductsSliderItem( productDetailed: productsProvider.productsDetailed[index],),
        ),
        itemCount: productsProvider.productsDetailed.length,
      ),
    );
  }
}