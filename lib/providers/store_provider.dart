import 'dart:convert';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class StoreProvider with ChangeNotifier {
  final String _baseUrl = "rigel-fl-app-default-rtdb.firebaseio.com";
  List<Store> stores = [];
  List<Store> storesFiltered = [];
  bool isLoading = true;
  //  Filters
  bool isFavorite = false;
  String countryName = "";

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
    filterStores();
    notifyListeners();
  }

  void filterStores(){
    storesFiltered = stores.where((store) => ((countryName != "") ? store.country.name == countryName : true) && store.isFavorite == isFavorite).toList();
    notifyListeners();
  }

  void getStoresWithOppositeFavVal(){
    storesFiltered = storesFiltered.where((store) => store.isFavorite == !isFavorite).toList();
  }

  Future<void> setAsFavorite(String id, bool isFavorite) async{
    await FirebaseDatabase.instance.ref("stores/$id").update({"is_favorite":isFavorite});
    Store store = stores.firstWhere((store) => store.id == id);
    store.isFavorite = isFavorite;
    notifyListeners();
  }
}

