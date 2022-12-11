import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static Future<bool> registerUser(Map userData) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    List<Map> usersData = [];
    usersData.add(userData);
    shared.setString('usersData', json.encode(usersData));
    return true;
  }

  static loginUser(String email, String password) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    dynamic usersData = [];
    String? dataList = shared.getString('usersData');
    if (dataList != null) {
      usersData = json.decode(dataList);
      for (var user in usersData) {
        if (user["email"] == email && password == user['password']) {
          return true;
        } else {
          return false;
        }
      }
    }
  }
}
