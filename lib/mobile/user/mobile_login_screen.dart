import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart'; // For Supabase integration
import 'package:xchange/mobile/screens/home_page.dart'; // Import HomePage
import 'package:xchange/mobile/user/login.dart';
import 'package:xchange/mobile/user/register.dart';

import '../const.dart';
import '../widgets/my_text_button.dart';
import 'home.dart';
import 'userHome.dart'; // Import Register screen

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({
    super.key,
  });

  static String id = "MobileLoginScreen";

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenState();
}

class _MobileLoginScreenState extends State<MobileLoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool showSpinner = false;

  //............................................................................

  Future<void> _login(String e, String p) async {
    String username = emailController.text.trim();
    String password = passwordController.text.trim();

    // validate

    try {
      var headers = {'Content-Type': 'application/json'};
      var data = json.encode(
          {"username": "noones@gmail.com", "password": "noones@gmail.com"});
      var dio = Dio();
      var response = await dio.request(
        'https://bigfidelisx.pythonanywhere.com/api/login/',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      // check if success
      if (response.statusCode == 200) {
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
        setState(() {
          showSpinner = false;
        });
      } else {
        // if not
        print('Status code: ${response.statusCode}');
        print('Response data: ${json.encode(response.data)}');
      }
    } catch (e) {
      print(e);
    }
  }

  //.............................................................................

  Future<void> login(String e, String p) async {
    if (e.isEmpty || p.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter username and password.'),
      ));
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false, // Prevent user from dismissing dialog
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(), // Spinning progress indicator
            ),
          ),
        );
      },
    );

    try {
      final user = await Supabase.instance.client.auth.signInWithPassword(
        email: e,
        password: p,
      );

      if (user != null) {
        Navigator.pop(context); // Dismiss the dialog
        // Login successful, navigate to home or other screen
        Navigator.pushNamed(context, HomePage.id);
      } else {
        // Login failed, handle specific Supabase errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed!'),
          ),
        );
      }
      Navigator.pushNamed(context, UserHome.id);
    } catch (e) {
      print(e);
      setState(() {
        Navigator.pop(context);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect username or password. or email not confirmed'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(0.2),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: textWhite),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MobileRegisterScreen.id);
                  },
                  child: Text(
                    "Register",
                    style: TextStyle(fontSize: 16, color: textWhite),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Login with your Email and password ",
              style: TextStyle(fontSize: 16, color: textGrey),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Email ",
              style: TextStyle(fontSize: 18, color: textWhite),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextButton(
              controller: emailController,
              hint: 'for example Ben Paul',
              obscure: false,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Password ",
              style: TextStyle(fontSize: 18, color: textWhite),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextButton(
              hint: 'Mypassword123@',
              obscure: true,
              controller: passwordController,
            ),
            SizedBox(
              height: 50,
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: textWhite,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: textGrey,
                  width: 2.0,
                ),
              ),
              child: Container(
                width: 300,
                height: 45,
                child: TextButton(
                  onPressed: () {
                    login(emailController.text, passwordController.text);
                    _login(emailController.text, passwordController.text);
                  },
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: backgroundColor, fontSize: 16),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(color: textWhite),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.green),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
