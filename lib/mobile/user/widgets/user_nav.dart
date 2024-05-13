import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../mobile_page.dart';

class UserNav extends StatelessWidget {
  const UserNav({super.key});

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
                  child: Image(image: AssetImage("assets/images/user.png"))),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, MobileScreenLayout.id);
              },
              child: Text('Logout'),
            ),
          ],
        ),
        Container(
          height: 50,
          child: IconButton(
              onPressed: () {},
              icon: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image(image: AssetImage("assets/images/img.jpg")))),
        ),
      ],
    );
  }
}
