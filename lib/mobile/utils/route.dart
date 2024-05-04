import 'package:flutter/material.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/screens/home_page.dart';


final Map<String, WidgetBuilder> routes = {
  HomePage.id: (context) => const Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: HomePage(),
        ),
      ),
 
};