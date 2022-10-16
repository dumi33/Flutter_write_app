import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";

import "TabPage.dart";


void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove(); // 스플래시 이미지 제거
    return MaterialApp(
      title: "Hand Writing",
      debugShowCheckedModeBanner: false,
      home: TabPage(),
    );
  }
}
