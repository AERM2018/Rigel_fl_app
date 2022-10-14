import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rigel_app/models/models.dart';

class ProductProvider with ChangeNotifier {
  List<ProductDetailed> productsDetailed = [];
  List<ProductCategory> categories = [];
  ProductDetailed? productSelected;
  ProductCategory? categorySelected;
  List<String> temporalProductImages = [];

  ProductProvider() {
    print("Products provider initialized");
    getProductCategories();
   
  }

  Future<void> getProductCategories() async {
    categories = await ProductCategory.find();
    categorySelected = categories[0];
    await getProducts(categoryId: categorySelected?.id);
    notifyListeners();
  }

  setCategorySelected(ProductCategory category) async{
    categorySelected = category;
     await getProducts(categoryId: categorySelected?.id);
    notifyListeners();
  }

  Future<void> getProducts({int? categoryId}) async {
    if (categoryId != null) {
      if (productsDetailed.isNotEmpty &&
          categoryId != productsDetailed[0].product.categoryId) {
        productSelected = null;
      }
      List<ProductDetailed> productsDetailedFound = await ProductDetailed.findAll();
      productsDetailed = productsDetailedFound.where(
        (productDetailed) =>productDetailed.product.categoryId == categoryId
      ).toList();
      if (productsDetailed.isNotEmpty && productSelected == null) {
        productSelected = productsDetailed[0];
      }
      notifyListeners();
    }
  }

  Future<void >addProduct(ProductDetailed productDetailed) async {
    await productDetailed.save();
    productsDetailed = [...productsDetailed, productDetailed];
    notifyListeners();
  }

  selectProduct(ProductDetailed productDetailed) async {
    productSelected = productDetailed;
    notifyListeners();
  }

  removeDefaultProduct() {
    productSelected = null;
    notifyListeners();
  }

  addTemporalProductImage(String path) {
    temporalProductImages = [...temporalProductImages, path.toString()];
    notifyListeners();
  }
}
