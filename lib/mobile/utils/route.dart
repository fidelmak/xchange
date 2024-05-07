import 'package:flutter/material.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/screens/home_page.dart';

import '../user/login.dart';
import '../user/mobile_login_screen.dart';
import '../user/register.dart';

final Map<String, WidgetBuilder> routes = {
  HomePage.id: (context) => const Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
  Login.id: (context) => const Login(),
  MobileLoginScreen.id: (context) => const MobileLoginScreen(),
  MobileRegisterScreen.id: (context) => const MobileRegisterScreen(),
};
