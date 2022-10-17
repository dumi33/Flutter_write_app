import "package:flutter/material.dart";

import "PhotoCheck.dart";

class FontProduction extends StatelessWidget {
  const FontProduction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 25),
        Center(
            child: Text(
          '자신만의 폰트를 제작해보세요',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )),
        Center(child: Text('문장을 따라 작성한 후 사진을 찍으면 폰트가 형성됩니다.')),
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
        SizedBox(height: 25),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => PhotoCheck()),
            );
          },
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
                fontFamily: 'milasiancirca',
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.normal),
          ),
          child: Text("촬영"),
        ),
      ],
    );
  }
}
