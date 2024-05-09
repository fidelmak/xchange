import 'package:flutter/material.dart';
import 'package:supabase/supabase.dart';

const supabaseUrl = 'https://cshtceayuqakjbnariuy.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

class SupabaseManager {
  final supabase = SupabaseClient(supabaseUrl, supabaseKey);

  Future<void> signUpUser(context, {String? email, password}) async {
    await supabase.auth.signUp(
      email: email,
      password: password,
    );

    SnackBar(
      content: Text('Registration Success'),
    );

    SnackBar(
      content: Text('error login'),
    );
  }

  // Future<void> signIn(context, {String? email, String? password}) async {
  //   try {
  //     await supabase.auth.signInWithPassword(
  //       email: email!,
  //       password: password!,
  //     );

  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Login Success'),
  //       ),
  //     );
  //   } catch (error) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(
  //         content: Text('Login Failed: $error'),
  //       ),
  //     );
  //   }
  // }
}
