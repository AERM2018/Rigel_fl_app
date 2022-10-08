import 'package:rigel_app/helpers/db_helper.dart';
import 'package:rigel_app/models/models.dart';
import 'package:sqflite/sqflite.dart';

class Product{
  final int? id;
  final int categoryId;
  final ProductCategory category;
  final double price;
  final int ranking;
  final String title;
  final String description;
  final double calories;
  final double additives;
  final double vitamins;
  final List<String> images;

  Product({
    this.id,
    required this.categoryId,
    required this.category,
    required this.price,
    required this.ranking,
    required this.title,
    required this.description,
    required this.calories,
    required this.additives,
    required this.vitamins,
    required this.images,
  });

  factory Product.fromMap(Map<String,dynamic> json) => Product(
    id: json["id"],
    categoryId: json["categoryId"],
    category: json["category"],
    price: json["price"],
    ranking: json["ranking"],
    title: json["title"],
    description: json["description"],
    calories: json["calories"],
    additives: json["additives"],
    vitamins: json["vitamins"],
    images: json["images"],
  );


  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "categoryId":categoryId,
      "category":category,
      "price":price,
      "ranking":ranking,
      "title":title,
      "description":description,
      "calories":calories,
      "additives":additives,
      "vitamins":vitamins,
      "images":images,
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

  static Future<void> insert(Product product) async{
    Database db = await DbHelper.instance.db;
    await db.insert('products', product.toMap());
  }
}

