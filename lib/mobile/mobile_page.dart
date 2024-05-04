import 'package:flutter/material.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/screens/home_page.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child:Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(child: HomePage()),
      )
    );
  }
}