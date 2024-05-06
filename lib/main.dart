import 'package:flutter/material.dart';
import 'package:xchange/desktop/desktop_page.dart';
import 'package:xchange/mobile/const.dart';

import 'mobile/mobile_page.dart';
import 'welcome_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'xchange',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: backgroundColor,
        ),
        home: const Responsive(
          mobileScreenLayout: MobileScreenLayout(),
          webScreenLayout: DesktopScreenLayout(),
        ));
  }
}
