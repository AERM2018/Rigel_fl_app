import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class StoreProvider with ChangeNotifier {
  final String _baseUrl = "rigel-fl-app-default-rtdb.firebaseio.com";
  List<Store> stores = [];
  List<Store> storesFiltered = [];
  bool isLoading = true;

  StoreProvider() {
    getStores( true);
  }

  Future<void> getStores( bool showLoading ) async {
     if (showLoading) {
      isLoading = true;
      notifyListeners();
    }
    final url = Uri.https(_baseUrl, "stores.json");
    final res = await http.get(url);
    final Map<String, dynamic> storesMap = json.decode(res.body);
    storesMap.forEach((key, value) {
      value['id'] = key;
      if (stores.where((store) => store.id == key).isEmpty) {
        stores.add(Store.fromJson(value));
        return;
      }
      int index = stores
          .indexOf(stores.firstWhere((country) => country.id == key));
      stores[index] = Store.fromJson(value);
    });
    isLoading = false;
    storesFiltered = stores;
    notifyListeners();
  }

  void filterStoresByCountry(String name){
    storesFiltered = stores.where((store) => store.country.name == name && store.isFavorite == false).toList();
    notifyListeners();
  }

  void filterStoresByFavoriteValue(bool isFavorite){
    if(!isFavorite){
      filterStoresByCountry(storesFiltered[0].country.name);
      return;
    }
    storesFiltered = stores.where((store) => store.isFavorite).toList();
    notifyListeners();
  }
}

