import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:web3dart/web3dart.dart';

import 'dart:convert';

import '../../const.dart';
import '../../utils/get_balance.dart';
import '../widgets/nft_listing.dart';
import 'get_ballance.dart';
import 'wallet_provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6ImEzOWQ4MWZhLWIwODktNDdjNy1hMjViLWY1OGU5YzdhNjNhMSIsIm9yZ0lkIjoiMzkyODM2IiwidXNlcklkIjoiNDAzNjUwIiwidHlwZUlkIjoiOGJiNjQwNmEtNDg5OC00OWZiLWJjOTctNWNjNjQwNDBiNTk3IiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE3MTYxMDc4NDksImV4cCI6NDg3MTg2Nzg0OX0.b_GLg-1zhNVgN49Kqp8_5ahu-w_JymmuMtjMBmRmu84';
  final String baseUrl = 'https://deep-index.moralis.io/api/v2';
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';
  String balance = '';
  String pvKey = '';
  final MoralisService moralisService = MoralisService();

  @override
  void initState() {
    super.initState();
    loadWalletData();
  }

  Future<void> loadWalletData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? privateKey = prefs.getString('privateKey');
    if (privateKey != null) {
      final walletProvider = WalletProvider();
      await walletProvider.loadPrivateKey();
      EthereumAddress address = await walletProvider.getPublicKey(privateKey);
      print(address.hex);
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });
      print(pvKey);
      String response = await getBalances(address.hex, 'sepolia');
      dynamic data = json.decode(response);
      String newBalance = data['balance'] ?? '0';

      // Transform balance from wei to ether
      EtherAmount latestBalance =
          EtherAmount.fromBigInt(EtherUnit.wei, BigInt.parse(newBalance));
      String latestBalanceInEther =
          latestBalance.getValueInUnit(EtherUnit.ether).toString();

      setState(() {
        balance = latestBalanceInEther;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(0.4),
        title: const Text(
          'Wallet',
          style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Wallet Address',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  walletAddress,
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32.0),
                const Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16.0),
                Text(
                  balance,
                  style: const TextStyle(fontSize: 20.0, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      await moralisService.getSepoliaBalance(
                          '0x9df19f2f103677baecb1f789a3723ffa73f4b3dd');
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text('Get Native Balance'),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'sendButton', // Unique tag for send button
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           SendTokensPage(privateKey: pvKey)),
                      // );
                    },
                    child: const Icon(
                      Icons.send,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Send'),
                ],
              ),
              Column(
                children: [
                  FloatingActionButton(
                    heroTag: 'refreshButton', // Unique tag for send button
                    onPressed: () {
                      setState(() {
                        // Update any necessary state variables or perform any actions to refresh the widget
                      });
                    },
                    child: const Icon(
                      Icons.replay_outlined,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  const Text('Refresh'),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
