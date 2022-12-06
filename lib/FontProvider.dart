import "dart:io";
import "dart:typed_data";
import "dart:convert";

import "package:flutter/material.dart";
import "package:dio/dio.dart";
import "package:image/image.dart" hide Image, Color;

class FontImageProvider extends ChangeNotifier {
  static final options = BaseOptions(
    baseUrl: "http://211.44.188.100:8080",
    connectTimeout: 5000, //5s
    receiveTimeout: 3000,
    contentType: Headers.formUrlEncodedContentType,
  );
  final dio = Dio(options);

  final _fontImages = List<Uint8List>.filled(3, Uint8List(0), growable: false);
  Uint8List _genByInput = Uint8List(0);

  get fontImages => _fontImages;

  get genByInput => _genByInput;

  Future<void> setFontImages(androidId, temporaryDirectory) async {
    for (int i = 0; i < _fontImages.length; ++i) {
      Response response = await dio.post("/FontTest/useFont", data: {
        "id": androidId,
        "index": "${i + 1}",
        "text": "'모란이 피기까지는'",
      });

      _fontImages[i] = encodePng(
              copyCrop(decodePng(base64Decode(response.data))!, 0, 0, 200, 150))
          as Uint8List;

      notifyListeners();
    }
  }

  setGenByInput(androidId, temporaryDirectory, index, text) async {
    Response response = await dio.post(
      "/FontTest/useFont",
      data: {
        "id": androidId,
        "index": "${index + 1}",
        "text": "'$text'",
      },
    );

    _genByInput = encodePng(
            copyCrop(decodePng(base64Decode(response.data))!, 0, 0, 200, 50))
        as Uint8List;

    notifyListeners();
  }
}
