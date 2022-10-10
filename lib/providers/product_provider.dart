import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class ProductProvider with ChangeNotifier{
  List<Product> products = [];
  late Product productSelected;
  List<String> productImages = [];

  ProductProvider(){
    print("Products provider initialized");
  }

  getProducts({int? categoryId}) async{
    List<Product> productsFound = await Product.find();
    products = productsFound.where((product) => categoryId != null ? product.categoryId == categoryId : true ).toList();
    notifyListeners();
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

selectDefaultProduct() {
  if(products.isNotEmpty){
    productSelected = products[0];
  }
    notifyListeners();
  }
  addProductImage(String path){
    productImages = [...productImages, path.toString()];
    print(productImages);
    notifyListeners();
  }
}