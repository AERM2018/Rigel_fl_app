import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rigel_app/models/models.dart';
import 'package:rigel_app/providers/product_categories_provider.dart';
import 'package:rigel_app/providers/product_provider.dart';
import 'package:rigel_app/themes/app_theme.dart';
import 'package:rigel_app/widgets/widgets.dart';
class ProductsSlider extends StatelessWidget {
  const ProductsSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductProvider productsProvider = Provider.of<ProductProvider>(context);
    List<Product> products = productsProvider.products;
    ProductCategoriesProvider productCategoriesProvider =
        Provider.of<ProductCategoriesProvider>(context);
    productsProvider.getProducts(
      categoryId:  productCategoriesProvider.categorySelected?.id
    );
    double widthModifier = products.length >= 4 ? 0.25 * 3 : 0.25 * products.length;
    return (productCategoriesProvider.categorySelected == null)
    ? CircularProgressIndicator(color: AppTheme.primaryColor,)
    : SizedBox(
      width: MediaQuery.of(context).size.width * widthModifier,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => SizedBox(
          width:  MediaQuery.of(context).size.width * 0.25,
          // color: Colors.amber,
          child: ProductsSliderItem( product: products[index],),
        ),
        itemCount: products.length,
      ),
    );
  }
}