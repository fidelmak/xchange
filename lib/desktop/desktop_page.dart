import 'package:flutter/material.dart';
import 'package:xchange/mobile/const.dart';

class DesktopScreenLayout extends StatelessWidget {
  const DesktopScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 4, 0),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Text(
              "Web not  Mobile Screen",
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
// MobileLoginScreen(), MobileRegisterScreen()