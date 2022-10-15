import 'package:flutter/material.dart';

import 'SelectFont.dart';

class PhotoCheck extends StatefulWidget {
  const PhotoCheck({super.key});

  @override
  State<PhotoCheck> createState() => _PhotoCheckState();
}

class _PhotoCheckState extends State<PhotoCheck> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Image.asset(
            'assets/writing-logo.png',
            height: 32,
          ),
          // centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          bottom: TabBar(
            isScrollable: false,
            indicatorWeight: 4,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelStyle: TextStyle(
              fontSize: 18,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: "폰트 제작법"),
              Tab(text: "폰트 선택하기"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
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
                            MaterialPageRoute(builder: (_) => (PhotoCheck())),
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
                        child: Text("확인"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => (SelectFont())),
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
            ),

            /// 나만의 메뉴
            Center(child: Text("폰트 선택하기")),
          ],
        ),
      ),
    );
  }
}
