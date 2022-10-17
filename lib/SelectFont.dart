import "package:flutter/material.dart";

import "PhotoCheck.dart";
import "UseFont.dart";

class SelectFont extends StatefulWidget {
  const SelectFont({Key? key}) : super(key: key);

  @override
  State<SelectFont> createState() => _SelectFontState();
}

class _SelectFontState extends State<SelectFont> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          '자신만의 폰트를 선택하세요',
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
            // borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          child: Image.asset(
            'assets/모란.JPG',
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            // borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          child: Image.asset(
            'assets/모란1.JPG',
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            // borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          child: Image.asset(
            'assets/모란2.JPG',
          ),
        ),
        SizedBox(height: 25),
        Column(
          children: [
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text("재촬영"),
                onPressed: () {
                  DefaultTabController.of(context)?.animateTo(0);
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: 'milasiancirca',
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                child: Text("사용하기"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => (UseFont())),
                  );
                },
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(
                      fontFamily: 'milasiancirca',
                      color: Colors.white,
                      fontSize: 20,
                      fontStyle: FontStyle.normal),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
