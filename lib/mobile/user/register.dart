import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import '../const.dart';
import '../screens/home_page.dart';
import '../widgets/my_text_button.dart';
import 'mobile_login_screen.dart';

class MobileRegisterScreen extends StatefulWidget {
  const MobileRegisterScreen({
    super.key,
  });
  static String id = "MobileRegisterScreen";

  @override
  State<MobileRegisterScreen> createState() => _MobileRegisterScreenState();
}

class _MobileRegisterScreenState extends State<MobileRegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> signUp(String e, String p) async {
    if (e.isEmpty || p.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please enter username and password to sign up.'),
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
      final user = await Supabase.instance.client.auth.signUp(
        email: e,
        password: p,
      );

      if (user != null) {
        Navigator.pop(context); // Dismiss the dialog
        // Login successful, navigate to home or other screen
        Navigator.pushNamed(context, MobileLoginScreen.id);
      } else {
        // Login failed, handle specific Supabase errors
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Sign-Up failed!'),
          ),
        );
      }
      Navigator.pushNamed(context, MobileLoginScreen.id);
    } catch (e) {
      print(e);
      setState(() {
        Navigator.pop(context);
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('username  exist.'),
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
                    backgroundColor: backgroundColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, MobileLoginScreen.id);
                  },
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
                    backgroundColor: Colors.grey.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  onPressed: () {},
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
              "Register  with your Name, Email and password ",
              style: TextStyle(fontSize: 16, color: textGrey),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Name",
              style: TextStyle(fontSize: 18, color: textWhite),
            ),
            SizedBox(
              height: 20,
            ),
            const MyTextButton(
              hint: 'Ben',
              obscure: false,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Email ",
              style: TextStyle(fontSize: 18, color: textWhite),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextButton(
              hint: 'Ben@gmail.com',
              obscure: false,
              controller: emailController,
            ),
            SizedBox(
              height: 20,
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
                    signUp(emailController.text, passwordController.text);
                  },
                  child: Text(
                    "Register",
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
                    "Login",
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
