import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  Future<String> getPrefItem(String itemKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(itemKey) ?? "";
  }

  setPrefItem(String itemKey, String itemVal) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(itemKey, itemVal);
  }
}
