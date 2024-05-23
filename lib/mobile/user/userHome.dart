import 'package:flutter/material.dart';
import 'package:xchange/main.dart';

import '../const.dart';
import '../user/provider/wallet_provider.dart';
import '../widgets/action_tabs.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/card_right.dart';
import '../widgets/card_tag.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/new.dart';

import '../widgets/update_price.dart';
import 'widgets/user_nav.dart';

class UserHome extends StatefulWidget {
  const UserHome({super.key});
  static String id = "UserHome";

  @override
  State<UserHome> createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  var name = "LIVE UPDATES";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: UserNav(),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: backgroundColor,
        body: Padding(
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
                  name,
                  style: TextStyle(color: Colors.white),
                ))
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNav(),
      ),
    );
  }
}
