import 'package:rigel_app/helpers/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class ProductCategory {
  final int? id;
  final String name;
  final String? iconName;

  ProductCategory({this.id, this.iconName, required this.name});

  factory ProductCategory.fromMap(Map<String, dynamic> json) => ProductCategory(
      id: json["id"], name: json["name"], iconName: json["iconName"]);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "iconName": iconName,
    };
  }

  static Future<List<ProductCategory>> find() async{
    Database db = await DbHelper.instance.db;
    var categories = await db.query('productCategories');
    return categories.isNotEmpty ? categories.map((category) => ProductCategory.fromMap(category)).toList() : [];
  }
}
