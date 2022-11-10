import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class CountryProvider with ChangeNotifier{

  final String _baseUrl = "rigel-fl-app-default-rtdb.firebaseio.com";
  List<Country> countries = [];
  bool isLoading = true;

  CountryProvider(){
    getCountries(true);
  }


  Future<void> getCountries( bool showLoading ) async{
    if(showLoading){
      isLoading = true;
      notifyListeners();
    }
    final url = Uri.https(_baseUrl, "countries.json");
    final res = await http.get(url);
    final Map<String, dynamic> countriesMap = json.decode(res.body);
    countriesMap.forEach((key, value) {
      value['id'] = key;
      if( countries.where((country) => country.id == key).isEmpty ){
        countries.add(Country.fromJson(value));
        return;
      }
      int index = countries.indexOf(countries.firstWhere((country) => country.id == key));
      countries[index] = Country.fromJson(value);

    });
    isLoading = false;
    notifyListeners();
  }
}