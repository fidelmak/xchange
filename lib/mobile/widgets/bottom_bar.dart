import 'package:flutter/material.dart';
import 'package:flutter_popup_card/flutter_popup_card.dart';
import 'package:xchange/mobile/user/provider/_wallet.dart';

import '../user/data/address.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_filled,
                    color: Colors.green,
                  )),
              Text('Home')
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.tram_rounded, color: Colors.grey)),
              Text('Trade'),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => AddressListPage()));
                  },
                  icon: Icon(Icons.upcoming_sharp, color: Colors.grey)),
              Text('Futures'),
            ],
          ),
          Column(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WalletPage()),
                    );
                  },
                  icon: Icon(Icons.wallet, color: Colors.grey)),
              Text('Wallet'),
            ],
          ),
        ],
      ),
    );
  }
}
