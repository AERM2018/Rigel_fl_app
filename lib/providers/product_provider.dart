import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class ProductProvider with ChangeNotifier{
  List<Product> products = [];
  Product? productSelected;
  List<String> productImages = [];

  ProductProvider(){
    print("Products provider initialized");
  }

  getProducts({int? categoryId}) async{
    if(categoryId != null){
      if(products.isNotEmpty &&categoryId != products[0].categoryId){
        productSelected = null;
      }
      List<Product> productsFound = await Product.find();
      products = productsFound.where((product) => product.categoryId == categoryId).toList();
      if(products.isNotEmpty && productSelected == null){
        productSelected = products[0];
      }
      notifyListeners();
    }
  }

  addProduct(Product product) async{
    await Product.insert(product);
    products = [...products, product];
    notifyListeners();
  }

  selectProduct(Product product){
    productSelected = product;
    notifyListeners();
  }

  removeDefaultProduct() {
    productSelected = null;
    notifyListeners();
  }
  addProductImage(String path){
    productImages = [...productImages, path.toString()];
    notifyListeners();
  }
}