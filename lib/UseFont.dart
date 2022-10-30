import "package:flutter/material.dart";

import "SelectFont.dart";

class UseFont extends StatefulWidget {
  const UseFont({super.key});

  @override
  State<UseFont> createState() => _UseFontState();
}

class _UseFontState extends State<UseFont> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Image.asset(
            "assets/모란.JPG",
          ),
        ),
        SizedBox(height: 25),
        Column(
          children: [
            SizedBox(
                width: 250,
                height: 40,
                child: TextField(
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
                onPressed: () {},
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
    );
  }
}
