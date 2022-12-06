import "dart:io";
import "dart:typed_data";
import "dart:convert";

import "package:flutter/material.dart";
import "package:path_provider/path_provider.dart";
import "package:dio/dio.dart";
import "package:image/image.dart" hide Image, Color;
import "package:fluttertoast/fluttertoast.dart";

class FontProvider extends ChangeNotifier {
  static final options = BaseOptions(
    baseUrl: "http://211.44.188.100:8080",
    connectTimeout: 5000, //5s
    receiveTimeout: 3000,
    contentType: Headers.formUrlEncodedContentType,
  );
  final dio = Dio(options);

  final _fontImages = List<Uint8List>.filled(3, Uint8List(0), growable: false);
  Uint8List _genByInput = Uint8List(0);
  late Directory externalDirectory;
  var _fontFile;

  Directory findRoot(FileSystemEntity entity){
    final Directory parent = entity.parent;
    // android Mobile device 일 경우에만 해당
    if(Platform.isAndroid) {
      if (parent.path == '/storage/emulated') return Directory(entity.path);
      return findRoot(parent);
    }
    else{
      return Directory(entity.path);
    }
  }

  get fontImages => _fontImages;

  get genByInput => _genByInput;

  get fontFile => _fontFile;

  Future<void> setFontImages(androidId) async {
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

  setGenByInput(androidId, index, text) async {
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

  setFontFile(androidId, index, dir) async {
    Fluttertoast.showToast(msg: "폰트 파일 다운로드를 시작합니다.\n약간의 시간이 걸릴 수 있습니다.");
    //externalDirectory = findRoot(await getApplicationDocumentsDirectory());
    externalDirectory = Directory("/storage/emulated/0/Download");

    Response response = await dio.download(
      "/FontTest/downloadFont?id=$androidId&index=${index + 1}",
      "$dir/myFont.ttf",
      options: Options(sendTimeout: 30000, receiveTimeout: 30000),
    );

    File("$dir/myFont.ttf").copySync("/storage/emulated/0/Download/myFont.ttf");
    Fluttertoast.showToast(msg: "폰트 파일 다운로드가 완료되었습니다.\n다운로드 폴더를 확인해보세요.");

    //_fontFile = "$externalDirectory/myFont.ttf";
    notifyListeners();
  }
}
