import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../user/login.dart';

class NavBarMenu extends StatelessWidget {
  const NavBarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                  height: 50,
                  child: Image(image: AssetImage("images/user.png"))),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Login.id);
              },
              child: Text('Sign in / Register'),
            ),
          ],
        ),
        Container(
          height: 50,
          child: IconButton(
              onPressed: () {},
              icon: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: AssetImage("images/img.jpg")))),
        ),
      ],
    );
  }
}
