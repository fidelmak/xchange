import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase/supabase.dart';
import 'package:gotrue/src/types/user.dart' as supabase_user;

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xchange/mobile/user/register.dart';

import '../../main.dart';
import '../auth/auth_service.dart';
import '../const.dart';
import '../widgets/my_text_button.dart';
import 'home.dart';

SupabaseManager s = SupabaseManager();

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
  bool _isLoading = false;

  Future<void> _login(email, password) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final User user = (await Supabase.instance.client.auth.signInWithPassword(
        email: emailController.text,
        password: passwordController.text,
      )) as User;

      if (user != null) {
        // Login successful, navigate to home or other screen
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Login failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Login failed!'),
          ),
        );
      }
    } catch (error) {
      // Handle errors
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${error.toString()}'),
        ),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
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
                  onPressed: () async {
                    _login(emailController, passwordController);
                    // s.signIn(passwordController.text);
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
