import 'package:flutter/material.dart';

import 'PhotoCheck.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
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
                  child: Text("촬영"),
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