import "package:flutter/material.dart";

class URLProvider extends ChangeNotifier {
  final String _url = "http://211.44.188.100:8080";

  String get url => _url;
}