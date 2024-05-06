import 'package:flutter/material.dart';

import '../widgets/card_right.dart';
import '../widgets/card_tag.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(24.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardTag(),
                SizedBox(
                  width: 15,
                ),
                CardRight(),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              "Mobile Screen",
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
