import 'package:flutter/widgets.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/entry.dart';

class FailureProvider with ChangeNotifier {
  final String _authToken;
  final String authUserId;
  FailureProvider(this._authToken, this.authUserId, this._failureList);
  List<Entry> _failureList = [];

  List<Entry> get failureList {
    return [..._failureList];
  }

  Future<void> fetchEntries() async {
    final url =
        'https://events-5eddb-default-rtdb.firebaseio.com/failure_entry.json?auth=$_authToken&orderBy="userId"&equalTo="$authUserId"';
    try {
      final response = await http.get(Uri.parse(url));
      final responseBody = json.decode(response.body) as Map<String, dynamic>;
      // call it as extractedData and instead of dynamic we can also use Object, but not a nested map,
      // even though we are getting a nested map, because dart doesn't understand that!
      final List<Entry> tempList = [];
      responseBody.forEach(
        (entryId, entryData) {
          tempList.add(
            Entry(
              id: entryId,
              title: entryData['title'],
              description: entryData['description'],
              date: DateTime.parse(entryData['date']),
            ),
          );
        },
      );
      _failureList = tempList;
      notifyListeners();
      // print(json.decode(response.body));
    } catch (error) {
      print(error);
      throw (error);
    }
  }

  Future<void> addData({
    String id,
    String title,
    String description,
    DateTime date,
  }) async {
    final url =
        'https://events-5eddb-default-rtdb.firebaseio.com/failure_entry.json?auth=$_authToken';
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode(
          {
            'title': title,
            'description': description,
            'date': date.toIso8601String(),
            'userId': authUserId,
          },
        ),
      );
      _failureList.add(Entry(
        id: json.decode(response.body)['name'],
        title: title,
        description: description,
        date: date,
      ));
    } catch (error) {
      print(error);
      throw error;
    }
    notifyListeners();
  }

  void delete(String id) {
    _failureList.removeWhere(
      (entry) => entry.id == id,
    );
    notifyListeners();
  }

  Future<void> updateData({
    String id,
    String title,
    String description,
    DateTime date,
  }) async {
    final url =
        'https://events-5eddb-default-rtdb.firebaseio.com/failure_entry/$id.json?auth=$_authToken';
    try {
      http.patch(Uri.parse(url),
          body: json.encode({
            'title': title,
            'description': description,
            'date': date.toIso8601String(),
          }));
    } catch (error) {
      print('failure update function error : $error');
      throw error;
    }
    final index = _failureList.indexWhere(
      (entry) => entry.id == id,
    );
    _failureList[index] = Entry(
      id: id,
      title: title,
      description: description,
      date: date,
    );

    // _failureList.insert(index, data);
    notifyListeners();
  }
}
