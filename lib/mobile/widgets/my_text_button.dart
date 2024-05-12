import 'package:flutter/material.dart';

import '../const.dart';

class MyTextButton extends StatelessWidget {
  final String hint;
  final bool obscure;
  final controller;

  const MyTextButton({
    super.key,
    required this.hint,
    required this.obscure,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(fontSize: 18, color: textGrey),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: priColor),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primary5),
              borderRadius: BorderRadius.circular(10),
            ),
            fillColor: Color.fromARGB(255, 31, 19, 19),
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
