import 'package:flutter/material.dart';
import 'package:xchange/desktop/desktop_page.dart';
import 'package:xchange/mobile/const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mobile/mobile_page.dart';
import 'mobile/utils/route.dart';
import 'welcome_page.dart';

void main() {
  Supabase.initialize(
    url: 'https://your-project-id.supabase.co',
    anonKey: 'your-anonymous-key',
  );

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
