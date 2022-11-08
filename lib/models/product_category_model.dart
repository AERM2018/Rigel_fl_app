import 'package:rigel_app/helpers/db_helper.dart';
import 'package:sqflite/sqflite.dart';

class ProductCategory {
  final String? id;
  final String name;

  ProductCategory({this.id, required this.name});

  factory ProductCategory.fromMap(Map<String, dynamic> json) => ProductCategory(
      id: json["id"], name: json["name"],);

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
    };
  }
}
