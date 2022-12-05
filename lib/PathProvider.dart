import "package:flutter/material.dart";

class PathProvider extends ChangeNotifier {
  String _imagePath = "";
  String _temporaryDirectory = "";

  String get imagePath => _imagePath;
  String get temporaryDirectory => _temporaryDirectory;

  void setImagePath(path) {
    _imagePath = path;
    notifyListeners();
  }

  void setTemporaryDirectory(path) {
    _temporaryDirectory = path;
    notifyListeners();
  }
}
