import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:rigel_app/models/models.dart';

class ProductProvider with ChangeNotifier {
  final String _baseUrl = "rigel-fl-app-default-rtdb.firebaseio.com";
  bool isLoading = true;
  List<Product> products = [];
  List<ProductCategory> categories = [];
  Product? productSelected;
  ProductCategory? categorySelected;
  List<String> temporalProductImages = [];

  ProductProvider() {
    print("Products provider initialized");
    getProductCategories();
   
  }

  Future<void> getProductCategories() async {
    isLoading = true;
    notifyListeners();

    final url = Uri.https(_baseUrl, "products_categories.json");
    final res = await http.get(url);
    final Map<String,dynamic> productsCategoriesMap = json.decode(res.body);

    getProducts(categoryId: productsCategoriesMap.keys.first);
  }

  setCategorySelected(ProductCategory category) async{
    categorySelected = category;
     await getProducts(categoryId: categorySelected?.id);
    notifyListeners();
  }

  Future<void> getProducts({String? categoryId}) async {
    if (categoryId != null) {
      if (products.isNotEmpty &&
          categoryId != products[0].category.id) {
        productSelected = null;
      }
       final url = Uri.https(_baseUrl, "products.json");
      final res = await http.get(url);
      final Map<String, dynamic> productsMap = json.decode(res.body);
      List<Product> productsFound = [];
      productsMap.forEach((key, value) {
        value["id"] = key;
        final product = Product.fromMap(value);
        productsFound.add(product);

      });
      products = productsFound.where(
      (product) =>product.category.id == categoryId
      ).toList();
      // List<ProductDetailed> productsDetailedFound = await ProductDetailed.findAll();
      // productsDetailed = productsDetailedFound.where(
      //   (productDetailed) =>productDetailed.product.categoryId == categoryId
      // ).toList();
      if (products.isNotEmpty && productSelected == null) {
        productSelected = products[0];
      }
      notifyListeners();
    }
  }

  Future<void >addProduct(Product product) async {
    // Save a product in firebase
    // await product.save();
    products = [...products, product];
    notifyListeners();
  }

  selectProduct(Product product) async {
    productSelected = product;
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

  removeTemporalProductImage(){
    temporalProductImages = [];
    notifyListeners();
  }
}
