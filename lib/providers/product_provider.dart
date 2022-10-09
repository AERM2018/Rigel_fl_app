import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class ProductProvider with ChangeNotifier{
  List<Product> products = [];
  late Product productSelected;
  List<String> productImages = [];

  ProductProvider(){
    print("Products provider initialized");
    getProducts();
  }

  getProducts() async{
    products = await Product.find();
    if(products.isNotEmpty){
      productSelected = products[0];
    }
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

  addProductImage(String path){
    productImages = [...productImages, path.toString()];
    print(productImages);
    notifyListeners();
  }
}