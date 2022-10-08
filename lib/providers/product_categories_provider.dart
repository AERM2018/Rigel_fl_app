import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class ProductCategoriesProvider with ChangeNotifier{
  List<ProductCategory> categories = [];
  late ProductCategory categorySelected;

  ProductCategoriesProvider(){
    print("Category provider initialized");
    getProductCategories();
  }

  getProductCategories() async{
    categories =  await ProductCategory.find();
    categorySelected = categories[0];
    notifyListeners();
  }

  setCategorySelected( ProductCategory category ){
    categorySelected = category;
    notifyListeners();
  }
}