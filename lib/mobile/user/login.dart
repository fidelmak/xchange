import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../const.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'mobile_login_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 900) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Web not  Mobile Screen",
                style: TextStyle(color: backgroundColor, fontSize: 20),
              ))
            ],
          ),
        );
      }
      // mobile screen
      return MobileLoginScreen();
      ;
    });
  }
}
