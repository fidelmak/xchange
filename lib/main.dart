import 'package:flutter/material.dart';
import 'package:xchange/desktop/desktop_page.dart';
import 'package:xchange/mobile/const.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xchange/mobile/user/provider/wallet_provider.dart';
import 'package:provider/provider.dart';

import 'mobile/mobile_page.dart';

import 'mobile/user/provider/import_wallet.dart';
import 'mobile/utils/route.dart';
import 'welcome_page.dart';

const supabaseUrl = 'https://pypzomuumotikjpxkntc.supabase.co';
const supabaseKey =
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InB5cHpvbXV1bW90aWtqcHhrbnRjIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTY0ODIzNDAsImV4cCI6MjAzMjA1ODM0MH0.G3C5MobcafTdDSTRiliHbidUpcgARjy4II1t26w-j7Y";
//final supabaseClient = SupabaseClient(supabaseUrl, supabaseKey);
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WalletProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
