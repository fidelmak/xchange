import 'package:flutter/material.dart';

import '../widgets/action_tabs.dart';
import '../widgets/card_right.dart';
import '../widgets/card_tag.dart';
import '../widgets/new.dart';
import '../widgets/price.dart';
import '../widgets/update_price.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String id = "HomePage";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
              height: 30,
            ),
            ActionBar(),
            SizedBox(
              height: 30,
            ),
            CryptoPricesWidget(),
            //PriceList(),
            SizedBox(
              height: 30,
            ),
            UpdatedPrice(),
            SizedBox(
              height: 30,
            ),
            Center(
                child: Text(
              "live updates".toUpperCase(),
              style: TextStyle(color: Colors.white),
            ))
          ],
        ),
      ),
    );
  }
}
