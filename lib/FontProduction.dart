import "dart:convert";
import "dart:io";
import "dart:typed_data";
import "package:flutter/material.dart";

import "package:document_scanner_flutter/document_scanner_flutter.dart";
import "package:document_scanner_flutter/configs/configs.dart";
import 'package:flutter/services.dart';
import "package:path_provider/path_provider.dart";
import "package:provider/provider.dart";
import "package:dio/dio.dart";
import "package:fluttertoast/fluttertoast.dart";
import 'package:shared_storage/shared_storage.dart';

import "PhotoCheck.dart";
import "PathProvider.dart";

class FontFrame {
  final Uint8List image;

  FontFrame({required this.image});

  factory FontFrame.fromJson(Map<String, dynamic> json) {
    return FontFrame(image: Uint8List(json['image']));
  }
}

class FontProduction extends StatefulWidget {
  const FontProduction({Key? key}) : super(key: key);

  @override
  State<FontProduction> createState() => _FontProductionState();
}

class _FontProductionState extends State<FontProduction> {
  late PathProvider _pathProvider;

  File? _scannedImage;

  openImageScanner(BuildContext context) async {
    var image = await DocumentScannerFlutter.launch(context,
        source: ScannerFileSource.CAMERA,
        labelsConfig: {
          ScannerLabelsConfig.ANDROID_NEXT_BUTTON_LABEL: "다음",
          ScannerLabelsConfig.ANDROID_SAVE_BUTTON_LABEL: "저장",
          ScannerLabelsConfig.ANDROID_OK_LABEL: "OK"
        });
    if (image != null) {
      _scannedImage = image;
      setState(() {});
    }
  }

  @override
  build(BuildContext context) {
    _pathProvider = Provider.of<PathProvider>(context);

    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          "자신만의 폰트를 제작해보세요",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(
            child: Text(
                "아래의 글씨 틀을 눌러 다운받아, 따라 작성한 후\n사진을 찍어 스캔하면 나만의 폰트가 만들어집니다.",
                textAlign: TextAlign.center)),
        SizedBox(height: 25),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(color: Colors.blue, width: 2),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            minimumSize: Size(250, 300),
            maximumSize: Size(250, 300),
          ),
          onPressed: () {
            showDialog(
                context: context,
                barrierDismissible: true, // 바깥 영역 터치시 닫을지 여부
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Image.asset(
                      "assets/font frame.png",
                    ),
                    actions: [
                      TextButton(
                        child: const Text("다운로드"),
                        onPressed: () async {
                          _pathProvider.setTemporaryDirectory(
                              (await getTemporaryDirectory()).path);

                          final options = BaseOptions(
                            baseUrl: "http://211.44.188.100:8080",
                            connectTimeout: 5000, //5s
                            receiveTimeout: 3000,
                          );
                          final dio = Dio(options);

                          Response response = await dio.get(
                            "/FontTest/downloadFontFrame",
                            options: Options(
                                sendTimeout: 30000, receiveTimeout: 30000),
                          );
                          Uint8List fontFrame =
                              base64Decode(response.data["image"]);
                          File file = await File(
                                  "${_pathProvider.temporaryDirectory}/font frame.png")
                              .create();
                          file.writeAsBytesSync(fontFrame);

                          Uri? uri = await openDocumentTree();

                          Map<String, dynamic>? result = await MethodChannel(
                                  "com.ivehement.plugins/saf/documentfile")
                              .invokeMapMethod<String, dynamic>(
                                  "createFile", <String, dynamic>{
                            "mimeType": "any",
                            "content": fontFrame,
                            "displayName": "font frame.png",
                            "directoryUri": "$uri",
                          });

                          if (result!["exists"] == "true") {
                            Fluttertoast.showToast(
                                msg: "글씨 틀 다운로드가 완료되었습니다.");
                          }
                        },
                      ),
                      TextButton(
                        child: const Text("확인"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
          child: Image.asset(
            "assets/font frame.png",
          ),
        ),
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () async {
            await openImageScanner(context);
            _pathProvider
                .setTemporaryDirectory((await getTemporaryDirectory()).path);

            if (!mounted) return;
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => (PhotoCheck(scannedImage: _scannedImage!))),
            );
          },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontFamily: "milasiancirca",
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.normal,
            ),
            minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
            maximumSize: Size(MediaQuery.of(context).size.width - 50, 50),
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.add_a_photo), Text(" 나의 손글씨 촬영")]),
        ),
      ],
    );
  }
}
