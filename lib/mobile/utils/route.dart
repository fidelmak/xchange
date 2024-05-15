import 'package:flutter/material.dart';
import 'package:xchange/main.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/screens/home_page.dart';
import 'package:xchange/mobile/user/home.dart';

import '../mobile_page.dart';
import '../user/login.dart';
import '../user/mobile_login_screen.dart';
import '../user/provider/generate_phrase.dart';
import '../user/provider/import_wallet.dart';
import '../user/register.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.id: (context) => const Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
  Login.id: (context) => const Login(),
  MobileLoginScreen.id: (context) => MobileLoginScreen(),
  MobileRegisterScreen.id: (context) => const MobileRegisterScreen(),
  Home.id: (context) => const Home(),
  MobileScreenLayout.id: (context) => const MobileScreenLayout(),
  GenerateMnemonicPage.id: (context) => const GenerateMnemonicPage(),
};
