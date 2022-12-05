import "package:flutter/material.dart";
import "package:flutter_native_splash/flutter_native_splash.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";

import "PathProvider.dart";
import "IDProvider.dart";
import "URLProvider.dart";
import "FontImageProvider.dart";

import "TabPage.dart";

void main() {
  // 화면 세로 고정
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => PathProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => IDProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => URLProvider(),
          ),
          ChangeNotifierProvider(
            create: (_) => FontImageProvider(),
          ),
        ],
        child: TabPage(),
      ),
    );
  }
}
