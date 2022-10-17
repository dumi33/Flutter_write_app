import "package:flutter/material.dart";

import "SelectFont.dart";

class PhotoCheck extends StatefulWidget {
  const PhotoCheck({Key? key}) : super(key: key);

  @override
  State<PhotoCheck> createState() => _PhotoCheckState();
}

class _PhotoCheckState extends State<PhotoCheck> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          '문장을 따라 작성한 후 촬영하세요',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        )),
        SizedBox(height: 25),
        Container(
          height: 250,
          width: 250,
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.blue),
            // borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          child: Image.asset(
            'assets/모란.JPG',
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => PhotoCheck()),
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
                      fontFamily: 'milasiancirca',
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
