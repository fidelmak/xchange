import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'crypto_detail.dart';
import 'crypto_provider.dart';

class CryptoListScreen extends StatefulWidget {
  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: provider.isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: provider.cryptos.length,
              itemBuilder: (context, index) {
                final crypto = provider.cryptos[index];
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 25,
                        height: 25,
                        child: ClipOval(
                          child: Image.network(
                            crypto.imageUrl,
                            width: 50,
                            height: 50,
                            fit: BoxFit
                                .cover, // Ensure the image fills the circular area
                          ),
                        ),
                      ),
                      Text(
                        "${crypto.name} /USDT  ".toUpperCase(),
                        style: TextStyle(color: Colors.black),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${crypto.currentPrice}'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                      Text(
                        ' ${crypto.priceChangePercentage}%'.toUpperCase(),
                        style: TextStyle(color: Colors.black),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CryptoDetailScreen(crypto: crypto),
                            ),
                          );
                        },
                        child: Text(
                          'Trade',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
