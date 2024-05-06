import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class UpdatedPrice extends StatefulWidget {
  @override
  _UpdatedPriceState createState() => _UpdatedPriceState();
}

class _UpdatedPriceState extends State<UpdatedPrice> {
  Map<String, double> cryptoPrices = {};
  Map<String, double> previousPrices = {};

  @override
  void initState() {
    super.initState();
    fetchCryptoPrices();
  }

  Future<void> fetchCryptoPrices() async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum,dogecoin,iota,bitcoin-cash,filecoin,eos,just,tron&vs_currencies=usd'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      setState(() {
        if (cryptoPrices.isNotEmpty) {
          previousPrices = Map.from(cryptoPrices);
        }
        cryptoPrices['BTC'] = data['bitcoin']['usd'];
        cryptoPrices['ETH'] = data['ethereum']['usd'];
        cryptoPrices['DOGE'] = data['dogecoin']['usd'];
        cryptoPrices['IOTA'] = data['iota']['usd'];
        cryptoPrices['BCH'] = data['bitcoin-cash']['usd'];
        cryptoPrices['FIL'] = data['filecoin']['usd'];
        cryptoPrices['EOS'] = data['eos']['usd'];
        cryptoPrices['JUST'] = data['just']['usd'];
        cryptoPrices['TRON'] = data['tron']['usd'];
      });
    } else {
      throw Exception('Failed to load crypto prices');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildCryptoPrice('BTC/USDT', cryptoPrices['BTC'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('ETH/USDT', cryptoPrices['ETH'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('TRON/USDT', cryptoPrices['TRON'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('EOS/USDT', cryptoPrices['EOS'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('DOGE/USDT', cryptoPrices['DOGE'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('BCH/USDT', cryptoPrices['BCH'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('IOTA/USDT', cryptoPrices['IOTA'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('JST/USDT', cryptoPrices['JUST'] ?? 0),
        SizedBox(height: 16),
        _buildCryptoPrice('FIL/USDT', cryptoPrices['FIL'] ?? 0),
      ],
    );
  }

  Widget _buildCryptoPrice(String symbol, double price) {
    double percentageChange = 0;
    if (previousPrices.containsKey(symbol)) {
      double previousPrice = previousPrices[symbol] ?? 0;
      percentageChange = ((price - previousPrice) / previousPrice) * 100;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          symbol,
          style: TextStyle(color: Colors.grey),
        ),
        Text(
          price != null ? ' ${price.toStringAsFixed(2)}' : 'Loading...',
          style: TextStyle(color: Colors.green),
          textAlign: TextAlign.center,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          onPressed: () {},
          child: Text(
            '${percentageChange.toStringAsFixed(2)}%',
            style: TextStyle(
              color: percentageChange >= 0 ? Colors.red : Colors.green,
            ),
          ),
        ),
      ],
    );
  }
}
