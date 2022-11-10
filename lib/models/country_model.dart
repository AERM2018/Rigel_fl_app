class Country{
  final String? id;
  final String name;
  final String shortName;
  final String flagImageUrl;
  final int numOfStores;

  Country({ 
    this.id,
    required this.name,
    required this.shortName,
    required this.flagImageUrl,
    required this.numOfStores,
  });

  factory Country.fromJson(Map<String,dynamic> json) => Country(
      id: json["id"],
      name: json["name"], 
      shortName:json["short_name"], 
      flagImageUrl: json["flag_image_url"], 
      numOfStores: json["num_of_stores"]
  );

  Map<String, dynamic> toMap(){
    return {
      "id":id,
      "name":name,
      "short_name":shortName,
      "flag_image_url":flagImageUrl,
      "num_of_stores":numOfStores
    };
  }
}