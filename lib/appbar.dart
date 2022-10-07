import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
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
              fontWeight: FontWeight.bold,
            ),
            tabs: [
              Tab(text: "폰트 제작법"),
              Tab(text: "폰트 선택하기"),
            ],
          ),
        )));
  }
}
