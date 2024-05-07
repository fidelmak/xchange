import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xchange/desktop/desktop_page.dart';
import 'package:xchange/mobile/const.dart';
import 'firebase_options.dart';

import 'mobile/mobile_page.dart';
import 'mobile/utils/route.dart';
import 'welcome_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
      ),
      routes: routes,
    );
  }
}
