import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xchange/mobile/const.dart';

class CryptoPricesWidget extends StatefulWidget {
  @override
  _CryptoPricesWidgetState createState() => _CryptoPricesWidgetState();
}

class _CryptoPricesWidgetState extends State<CryptoPricesWidget> {
  Map<String, double> cryptoPrices = {};
  Map<String, double> previousPrices = {};

  @override
  void initState() {
    super.initState();
    fetchCryptoPrices();
  }

  Future<void> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,tron&vs_currencies=usd'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        if (cryptoPrices.isNotEmpty) {
          previousPrices = Map.from(cryptoPrices);
        }
        cryptoPrices['BTC'] = data['bitcoin']['usd'];
        cryptoPrices['ETH'] = data['ethereum']['usd'];
        cryptoPrices['TRON'] = data['tron']['usd'];
      });
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        color: cardColor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCryptoPrice('BTC/USDT', cryptoPrices['BTC'] ?? 0),
              _buildCryptoPrice('ETH/USDT', cryptoPrices['ETH'] ?? 0),
              _buildCryptoPrice('TRON/USDT', cryptoPrices['TRON'] ?? 0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCryptoPrice(String symbol, double price) {
    double percentageChange = 0;
    if (previousPrices.containsKey(symbol)) {
      double previousPrice = previousPrices[symbol] ?? 0;
      percentageChange = ((price - previousPrice) / previousPrice) * 100;
    }

    return Column(
      children: [
        Text(
          symbol,
          style: TextStyle(color: Colors.grey),
        ),
        SizedBox(height: 8),
        Text(
          price != null ? '\$${price.toStringAsFixed(2)}' : 'Loading...',
          style: TextStyle(color: Colors.green),
        ),
        SizedBox(height: 4),
        Text(
          '${percentageChange.toStringAsFixed(2)}%',
          style: TextStyle(
            color: percentageChange <= 0 ? Colors.green : Colors.green,
          ),
        ),
        ListTile(
          leading: Icon(Icons.speaker),
          title: Text("We currently offer access to flat currency"),
          trailing: IconButton(
            onPressed: () {},
            icon: Icon(Icons.menu_outlined),
          ),
        )
      ],
    );
  }
}
