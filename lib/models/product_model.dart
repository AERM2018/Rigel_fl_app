import 'package:rigel_app/helpers/db_helper.dart';
import 'package:rigel_app/models/models.dart';
import 'package:sqflite/sqflite.dart';

class Product{
  final int? id;
  final int categoryId;
  // final ProductCategory category;
  final double price;
  final int? ranking;
  final String title;
  final String description;
  final double calories;
  final double additives;
  final double vitamins;
  

  Product({
    this.id,
    required this.categoryId,
    // required this.category,
    required this.price,
    this.ranking,
    required this.title,
    required this.description,
    required this.calories,
    required this.additives,
    required this.vitamins,
    
  });

  factory Product.fromMap(Map<String,dynamic> json) => Product(
    id: json["id"],
    categoryId: json["categoryId"],
    price: json["price"],
    ranking: json["ranking"],
    title: json["title"],
    description: json["description"],
    calories: json["calories"],
    additives: json["additives"],
    vitamins: json["vitamins"],
   
  );


  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "categoryId":categoryId,
      // "category":category,
      "price":price,
      "ranking":ranking,
      "title":title,
      "description":description,
      "calories":calories,
      "additives":additives,
      "vitamins":vitamins,
    };
  }

  static Future<List<Product>> find() async{
    Database db = await DbHelper.instance.db;
    var products = await db.query('products');
    return products.isNotEmpty
        ? products
            .map((product) => Product.fromMap(product))
            .toList()
        : [];
  }

  Future<int> insert() async{
    Database db = await DbHelper.instance.db;
    return await db.insert('products', toMap());
  }
}

class ProductImage{
  final int? id;
  late int? productId;
  final String path;

  ProductImage({
    this.id,
    this.productId,
    required this.path
  });

  factory ProductImage.fromMap(Map<String, dynamic> json) => ProductImage(
        id: json["id"],
        path: json["path"],
        productId: json["productId"]
      );

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "productId":productId,
      "path":path
    };
  }

  Future<void> insert() async{
    Database db = await DbHelper.instance.db;
    await db.insert('productImages', toMap());
  }

  static Future<List<ProductImage>> findAllByProductId(int? productId) async {
    Database db = await DbHelper.instance.db;
    var productImages = await db.query('productImages', where: "productId = ?", whereArgs: [productId]);
    return productImages.isNotEmpty
        ? productImages.map((e) => ProductImage.fromMap(e)).toList()
        : [];
  }
}

class ProductDetailed{
  Product product;
  List<ProductImage> images;

  ProductDetailed({
    required this.product,
    required this.images
  });


  save()async{
    int id = await product.insert();
    await Future.wait(images.map((productImage) async{
      productImage.productId = id;
      await productImage.insert();
    }));
  }

  static Future<List<ProductDetailed>>findAll() async{
      print("id");
    Database db = await DbHelper.instance.db;
    var rawProducts = await db.query("products");
    print("raw");
    print(rawProducts);
    return (rawProducts.isNotEmpty)
    ? await Future.wait(rawProducts.map((rawProduct) async{
      var images = await ProductImage.findAllByProductId(int.tryParse(rawProduct["id"].toString()));
      return ProductDetailed(product: Product.fromMap(rawProduct), images: images);
    }))
    : [];
  }
}


