import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DataProvider with ChangeNotifier {
  List listOfData = [];
  List searchList = [];
  List filteredList = [];

  final baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  void fetch() async {
    var response = await http.get(Uri.parse(baseUrl));
    var data = json.decode(response.body);
    listOfData = data['pokemon'];
    notifyListeners();
  }

  void search(word) {
    searchList = listOfData
        .where((element) =>
            element['name'].toLowerCase().contains(word.toLowerCase()))
        .toList();
    notifyListeners();
  }

  void filter({String? type, String? weakness, bool? both}) {
    filteredList = listOfData
        .where((element) => both!
            ? element['types'].contains(type) &&
                element['weakness'].contains(weakness)
            : element['types'].contains(type) ||
                element['weakness'].contains(weakness))
        .toList();
  }
}
