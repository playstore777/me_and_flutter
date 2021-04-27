import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:my_memories/models/my_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expiryDate;

  String get authUserId {
    return _userId;
  }

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  //My Approach
  /* bool get isAuth {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null){
          return true;
        }
        return false;
  }
  */

  Future<void> _authenticate(
      String email, String password, String urlSegment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCivwDL1m3JkQv3h4iULd9tdh4oU8dWEZg';
    try {
      final response = await http.post(Uri.parse(url),
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true,
          }));
      // print('$urlSegment: ${json.decode(response.body)}');
      final responseDataDecoded = json.decode(response.body);
      if (responseDataDecoded['error'] != null) {
        // since we get a map having error as it's key, we get it only when there is any error!
        // if there is no error then, it will be null!
        throw MyException(responseDataDecoded['error']);
      }
      // else
      _token = responseDataDecoded['idToken'];
      _userId = responseDataDecoded['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseDataDecoded['expiresIn'],
          ),
        ),
      );
      notifyListeners();
      print('$_token, $_userId, $_expiryDate');
    } catch (error) {
      print('Authenticate Error: $error');
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  void logout() {
    _token = null;
    _userId = null;
    _expiryDate = null;
    notifyListeners();
  }
}
