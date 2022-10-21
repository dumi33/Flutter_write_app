import "dart:io";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "PathProvider.dart";
import "FontProduction.dart";

class PhotoCheck extends StatefulWidget {
  const PhotoCheck({Key? key}) : super(key: key);

  @override
  State<PhotoCheck> createState() => _PhotoCheckState();
}

class _PhotoCheckState extends State<PhotoCheck> {
  late PathProvider _pathProvider;

  @override
  Widget build(BuildContext context) {
    _pathProvider = Provider.of<PathProvider>(context);
    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          "문장을 따라 작성한 후 촬영하세요",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(height: 25),
        Container(
          width: 350,
          height: 250,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          child:
          AspectRatio(
            aspectRatio: 1,
            child: ClipRect(
              child: Transform.scale(
                scale: 3,
                child: Center(
                  child: Image.file(File(_pathProvider.imagePath)),
                ),
              ),
            ),
          ),

        ),
        SizedBox(height: 25),
        Column(
          children: [
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => FontProduction()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: "milasiancirca",
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Icon(Icons.add_a_photo), Text(" 재촬영")]),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  DefaultTabController.of(context)?.animateTo(1);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: "milasiancirca",
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                child: Text("확인"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
