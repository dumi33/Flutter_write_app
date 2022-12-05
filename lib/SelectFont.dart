import "dart:io";
import "package:flutter/material.dart";
import "package:provider/provider.dart";

import "UseFont.dart";
import "PathProvider.dart";

class SelectFont extends StatefulWidget {
  const SelectFont({Key? key}) : super(key: key);

  @override
  State<SelectFont> createState() => _SelectFontState();
}

class _SelectFontState extends State<SelectFont> {
  late PathProvider _pathProvider;
  List<bool> toggleList = List.generate(3, (index) => false);


  @override
  Widget build(BuildContext context) {
    _pathProvider = Provider.of<PathProvider>(context);

    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          "자신만의 폰트를 선택하세요",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(height: 25),
        InkWell(
          onTap: () {
            setState(() {
              toggleList[0] = !toggleList[0];
              toggleList[1] = false;
              toggleList[2] = false;
            });
          },
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: toggleList[0] ? Colors.red : Colors.blue ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
            child: Image.file(File("${_pathProvider.temporaryDirectory}/fontImage0.png"))
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              toggleList[0] = false;
              toggleList[1] = !toggleList[1];
              toggleList[2] = false;
            });
          },
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: toggleList[1] ? Colors.red : Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Image.file(File("${_pathProvider.temporaryDirectory}/fontImage1.png"))
          ),
        ),
        SizedBox(height: 10),
        InkWell(
          onTap: () {
            setState(() {
              toggleList[0] = false;
              toggleList[1] = false;
              toggleList[2] = !toggleList[2];
            });
          },
          child: Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: toggleList[2] ? Colors.red : Colors.blue),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: Image.file(File("${_pathProvider.temporaryDirectory}/fontImage2.png"))
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
                  DefaultTabController.of(context)?.animateTo(0);
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => (UseFont())),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: "milasiancirca",
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
                child: Text("사용하기"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
