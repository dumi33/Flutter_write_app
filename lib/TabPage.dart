import "package:flutter/material.dart";

import "CustomNavigator.dart";
import "FontProduction.dart";
import "SelectFont.dart";

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final _pages = const [FontProduction(), SelectFont()];
  final _navigatorKeyList =
      List.generate(2, (index) => GlobalKey<NavigatorState>());
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          return !(await _navigatorKeyList[_currentIndex]
              .currentState!
              .maybePop());
        },
        child: DefaultTabController(
          length: 2,
          child: Builder(builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Image.asset(
                  "assets/writing-logo.png",
                  height: 32,
                ),
                // centerTitle: true,
                backgroundColor: Colors.white,
                elevation: 0.0,
                centerTitle: true,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(50),
                    child: DecoratedBox(
                      // 탭 밑줄 추가하기 위한 코드
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 2, color: Colors.grey))),
                      child: TabBar(
                        onTap: (index) {
                          // 탭을 터치했을 때 무반응으로 만들기 위한 코드
                          if (DefaultTabController.of(context)!
                              .indexIsChanging) {
                            DefaultTabController.of(context)!.index =
                                DefaultTabController.of(context)!.previousIndex;
                          } else {
                            return;
                          }
                        },
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
                    )),
              ),
              body: Container(
                color: Colors.white,
                child: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: _pages.map(
                    (page) {
                      int index = _pages.indexOf(page);
                      return CustomNavigator(
                        page: page,
                        navigatorKey: _navigatorKeyList[index],
                      );
                    },
                  ).toList(),
                ),
              ),
            );
          }),
        ));
  }
}
