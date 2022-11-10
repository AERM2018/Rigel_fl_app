import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:rigel_app/models/models.dart';

class CurrencyProvider with ChangeNotifier {
  final String _baseUrl = "rigel-fl-app-default-rtdb.firebaseio.com";
  List<Currency> currencies = [];
  bool isLoading = true;

  CurrencyProvider() {
    getCurrencies(true);
  }

  Future<void> getCurrencies(bool showLoading) async {
    if (showLoading) {
      isLoading = true;
      notifyListeners();
    }
     final url = Uri.https(_baseUrl, "currencies.json");
    final res = await http.get(url);
    final Map<String, dynamic> currenciesMap = json.decode(res.body);
    currenciesMap.forEach((key, value) {
      value['id'] = key;
      if (currencies.where((currency) => currency.id == key).isEmpty) {
        currencies.add(Currency.fromJson(value));
        return;
      }
      int index = currencies
          .indexOf(currencies.firstWhere((currency) => currency.id == key));
      currencies[index] = Currency.fromJson(value);
    });
    isLoading = false;
    notifyListeners();
  }
}
