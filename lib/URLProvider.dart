import 'package:flutter/material.dart';

class URLProvider extends ChangeNotifier {
  final String _url = "211.44.188.100:8080";

  String get url => _url;

  // void setURL() {
  //   _url = "211.44.188.100:8080";
  //   notifyListeners();
  // }
}