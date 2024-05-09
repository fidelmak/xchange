import 'package:flutter/material.dart';
import 'package:xchange/desktop/desktop_page.dart';
import 'package:xchange/mobile/const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'mobile/mobile_page.dart';
import 'mobile/utils/route.dart';
import 'welcome_page.dart';

const supabaseUrl = 'https://cshtceayuqakjbnariuy.supabase.co';
const supabaseKey =
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNzaHRjZWF5dXFha2pibmFyaXV5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTUxMTI5MzcsImV4cCI6MjAzMDY4ODkzN30.oAR58SzAHaQHY2psne3AYxGt5BVIuHMxeO9HcDhIyyI';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
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
