import 'package:flutter/material.dart';

import '../const.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: cardColor,
      child: SizedBox(
        height: 40,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Symbol",
                style: TextStyle(color: primary5),
              ),
              Text(
                "Latest Price ",
                style: TextStyle(color: primary5),
              ),
              Text(
                "24hFlunctuation",
                style: TextStyle(color: primary5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
