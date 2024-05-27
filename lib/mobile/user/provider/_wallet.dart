import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:web3dart/web3dart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:flutter/services.dart';
import '../../const.dart';
import '../../utils/get_balance.dart';
import '../data/data.dart';
import 'get_ballance.dart';
import 'wallet_provider.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
  final String apiKey = 'your_api_key';
  final String baseUrl = 'https://deep-index.moralis.io/api/v2';
}

class _WalletPageState extends State<WalletPage> {
  String walletAddress = '';
  String balance = ' USD 0';
  String pvKey = '';
  final MoralisService moralisService = MoralisService();
  TextEditingController _addressController = TextEditingController();

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

      // Store the address in the database
      final dbHelper = DatabaseHelper();
      // await dbHelper.insertAddress(address.hex);

      // Update state only once after all operations
      setState(() {
        walletAddress = address.hex;
        pvKey = privateKey;
      });

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

  void _copyAddressToClipboard() {
    Clipboard.setData(ClipboardData(text: walletAddress));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Wallet address copied to clipboard')),
    );
    _showPasteAddressDialog();
  }

  void _showPasteAddressDialog() {
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Paste Address'),
            content: TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: ' Address',
                hintText: 'your wallet address here',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(''),
              ),
              TextButton(
                onPressed: () async {
                  String pastedAddress = _addressController.text;
                  if (pastedAddress.isNotEmpty) {
                    final dbHelper = DatabaseHelper();
                    await dbHelper.insertAddress(pastedAddress);
                    Navigator.of(context).pop();
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => AddressListPage(),
                    //   ),
                    // );
                  }
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    });
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              balance,
              style: const TextStyle(fontSize: 15.0, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Wallet Address',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            GestureDetector(
              onTap: _copyAddressToClipboard,
              child: Text(
                walletAddress,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(
                      255, 172, 213, 248), // Make the address look clickable
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),
            const SizedBox(height: 36.0),
            const SizedBox(height: 36.0),
            const SizedBox(height: 36.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Implement receive functionality here
                  },
                  child: const Text('Receive'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement send functionality here
                  },
                  child: const Text('Swap Tokens'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Implement swap tokens functionality here
                  },
                  child: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
