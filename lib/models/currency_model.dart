class Currency{
  String? id;
  final String name;
  final String shortName;
  final String imageUrl;

  Currency({
    this.id,
    required this.name,
    required this.shortName,
    required this.imageUrl,
  });

  factory Currency.fromJson(Map<String,dynamic> json) => Currency(
    id : json["id"],
    name : json["name"],
    shortName : json["short_name"],
    imageUrl : json["image_url"],
  );

  Map<String,dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "short_name":shortName,
      "image_url":imageUrl,
    };
  }
}