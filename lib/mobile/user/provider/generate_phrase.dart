import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:xchange/mobile/const.dart';
import 'verify_mneomonic_page.dart';
import 'wallet_provider.dart';

class GenerateMnemonicPage extends StatelessWidget {
  const GenerateMnemonicPage({super.key});
  static String id = "GenerateMnemonic";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wallet Phrase',
          style: TextStyle(fontSize: 12.0, fontStyle: FontStyle.italic),
        ),
        backgroundColor: backgroundColor.withOpacity(0.4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Consumer<WalletProvider>(
            builder: (context, walletProvider, child) {
              final mnemonic = walletProvider.generateMnemonic();
              if (mnemonic.isEmpty) {
                walletProvider.generateMnemonic();
                return const Center(child: CircularProgressIndicator());
              }

              final mnemonicWords = mnemonic.split(' ');
              void copyToClipboard() {
                Clipboard.setData(ClipboardData(text: mnemonic));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Wallet Phrase Copied to Clipboard')),
                );

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VerifyMnemonicPage(mnemonic: mnemonic),
                  ),
                );
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      'Please store this wallet phrase safely:',
                      style: TextStyle(
                          fontSize: 18.0, fontStyle: FontStyle.italic),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      mnemonicWords.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          '${index + 1}. ${mnemonicWords[index]}',
                          style: const TextStyle(fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton.icon(
                    onPressed: () {
                      copyToClipboard();
                    },
                    icon: const Icon(Icons.copy),
                    label: const Text(
                      'Copy to Clipboard',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.4),
                      elevation: 4,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
