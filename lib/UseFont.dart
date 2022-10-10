import 'package:flutter/material.dart';

class UseFont extends StatefulWidget {
  const UseFont({super.key});

  @override
  State<UseFont> createState() => _UseFontState();
}

class _UseFontState extends State<UseFont> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Image.asset(
            'assets/tmp로고.JPG',
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
                      '자신만의 폰트를 사용해보세요.',
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
                              // labelText: '적용할 글자를 입력하세요',
                            ))),
                    SizedBox(height: 15),
                    SizedBox(
                      width: 250,
                      height: 40,
                      child: ElevatedButton(
                        child: Text("다운로드"),
                        onPressed: () {},
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
