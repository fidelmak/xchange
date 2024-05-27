import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xchange/mobile/const.dart';
import 'package:xchange/mobile/user/provider/_wallet.dart';
import 'package:supabase/supabase.dart';

import '../../../main.dart';
import '../data/data.dart';
import 'wallet_provider.dart';

class VerifyMnemonicPage extends StatefulWidget {
  final String mnemonic;

  const VerifyMnemonicPage({Key? key, required this.mnemonic})
      : super(key: key);

  @override
  _VerifyMnemonicPageState createState() => _VerifyMnemonicPageState();
}

class _VerifyMnemonicPageState extends State<VerifyMnemonicPage> {
  bool isVerified = false;
  String verificationText = '';

  void verifyMnemonic() {
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);

    if (verificationText.trim() == widget.mnemonic.trim()) {
      walletProvider.getPrivateKey(widget.mnemonic).then((privateKey) {
        setState(() {
          isVerified = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    void navigateToWalletPage() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WalletPage()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor.withOpacity(0.4),
        title: const Text(
          'Verify your wallet and Create',
          style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Please verify your Wallet phrase:',
              style: TextStyle(fontSize: 18.0),
            ),
            const SizedBox(height: 24.0),
            TextField(
              onChanged: (value) {
                setState(() {
                  verificationText = value;

                  print(verificationText);
                });
              },
              decoration: const InputDecoration(
                labelText: 'Enter Wallet phrase',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                verifyMnemonic();
              },
              child: const Text('Verify'),
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: isVerified ? navigateToWalletPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
              ),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
