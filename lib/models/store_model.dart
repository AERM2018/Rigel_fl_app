import 'package:rigel_app/models/country_model.dart';

class Store{
  String? id;
  final String name;
  final String address;
  final String zip;
  bool isFavorite;
  final Country country;

  Store({
    this.id,
    required this.isFavorite,
    required this.name,
    required this.address,
    required this.zip,
    required this.country
  });

  factory Store.fromJson(Map<String,dynamic> json) => Store(
    id: json["id"],
    name: json["name"],
    address: json["address"],
    zip: json["zip"],
    isFavorite: json["is_favorite"],
    country: Country.fromJson(json["country"]),
  );

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "address":address,
      "zip":zip,
      "country":country.toMap()
    };
  }
}