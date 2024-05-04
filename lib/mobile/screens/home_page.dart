import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
   static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return const  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: [Center(child: Text("Mobile Screen", style: TextStyle(color: Colors.white),))],
    );
  }
}