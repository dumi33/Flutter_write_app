import "dart:io";
import "dart:typed_data";
import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:image/image.dart" hide Image, Color;

class FontImageProvider extends ChangeNotifier {
  final _fontImages = List<Uint8List>.filled(3, Uint8List(0), growable: false);

  get fontImages => _fontImages;

  Future<void> setFontImages(url, androidId, temporaryDirectory) async {
    for (int i = 0; i < _fontImages.length; ++i) {
      http.Response response = await http.post(
        url,
        headers: <String, String>{
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: <String, String>{
          "id": androidId,
          "index": "${i + 1}",
          "text": """모란이 피기까지는
                        나는 아직 나의 봄을 기다리고 있을테요
                        모란이 뚝뚝 떨어져버린 날
                        나는 비로소 봄을 여읜 설움에 잠길테요""",
        },
      );

      fontImages[i] = base64Decode(response.body);

      File("$temporaryDirectory/fontImage$i.png").writeAsBytesSync(encodePng(copyCrop(
          decodePng(fontImages[i])!,
          0,
          0,
          200,
          150)));

      notifyListeners();
    }
  }
}
