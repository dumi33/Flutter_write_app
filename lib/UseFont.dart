import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "SelectFont.dart";

import "IDProvider.dart";
import "PathProvider.dart";
import "FontProvider.dart";

class UseFont extends StatefulWidget {
  final int index;

  const UseFont({Key? key, required this.index}) : super(key: key);

  @override
  State<UseFont> createState() => _UseFontState();
}

class _UseFontState extends State<UseFont> {
  late IDProvider _idProvider;
  late PathProvider _pathProvider;
  late FontProvider _fontProvider;

  @override
  Widget build(BuildContext context) {
    _idProvider = Provider.of<IDProvider>(context);
    _pathProvider = Provider.of<PathProvider>(context);
    _fontProvider = Provider.of<FontProvider>(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25),
          Center(
              child: Text(
            "자신만의 폰트를 사용해보세요.",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          )),
          SizedBox(height: 25),
          Container(
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Image.memory(_fontProvider.genByInput),
          ),
          SizedBox(height: 25),
          Column(
            children: [
              SizedBox(
                  width: 250,
                  height: 40,
                  child: TextField(
                      onChanged: (text) async {
                        await _fontProvider.setGenByInput(
                            _idProvider.androidId,
                            widget.index,
                            text);
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey,
                        border: OutlineInputBorder(),
                        // labelText: "적용할 글자를 입력하세요",
                      ))),
              SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    _fontProvider.setFontFile(_idProvider.androidId, widget.index, _pathProvider.temporaryDirectory);
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontFamily: "milasiancirca",
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                  child: Text("다운로드"),
                ),
              ),
              SizedBox(height: 15),
              SizedBox(
                width: 250,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => (SelectFont())),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(
                        fontFamily: "milasiancirca",
                        color: Colors.white,
                        fontSize: 20,
                        fontStyle: FontStyle.normal),
                  ),
                  child: Text("폰트 다시 선택"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
