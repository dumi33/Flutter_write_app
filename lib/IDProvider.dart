import 'package:flutter/material.dart';
import 'package:android_id/android_id.dart';
import 'package:flutter/services.dart';

class IDProvider extends ChangeNotifier {
  final _androidIdPlugin = AndroidId();
  String _androidId = "Unknown";

  String get androidId => _androidId;

  Future<void> setAndroidId() async {
    String androidId;
    try {
      androidId = await _androidIdPlugin.getId() ?? "Unknown ID";
    } on PlatformException {
      androidId = "Android ID를 찾을 수 없습니다.";
    }

    _androidId = androidId;

    notifyListeners();
  }
}