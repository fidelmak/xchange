import 'package:flutter/material.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/screens/home_page.dart';
import 'package:xchange/mobile/widgets/my_app_bar.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child:Scaffold(
        appBar:  AppBar( title :NavBarMenu(),
        backgroundColor: Colors.transparent,),
        backgroundColor: backgroundColor,
        body: SafeArea(child: HomePage()),
      )
    );
  }
}