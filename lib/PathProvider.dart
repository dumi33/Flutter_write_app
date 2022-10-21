import "package:flutter/material.dart";

class PathProvider extends ChangeNotifier {
  String _imagePath = "";

  String get imagePath => _imagePath;

  void setImagePath(path) {
    _imagePath = path;
    notifyListeners();
  }
}