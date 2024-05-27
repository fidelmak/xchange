import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AddressListPage extends StatefulWidget {
  @override
  _AddressListPageState createState() => _AddressListPageState();
}

class _AddressListPageState extends State<AddressListPage> {
  Map<String, dynamic>? tickerData;

  @override
  void initState() {
    super.initState();
    fetchTickerData();
  }

  Future<void> fetchTickerData() async {
    final response = await http
        .get(Uri.parse('https://api.coingecko.com/api/v3/coins/bitcoin'));
    if (response.statusCode == 200) {
      setState(() {
        tickerData = jsonDecode(response.body);
      });
    } else {
      throw Exception('Failed to load ticker data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Ticker'),
      ),
      body: Center(
        child: tickerData == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Bitcoin Price: \$${tickerData!['market_data']['current_price']['usd']}',
                    style: TextStyle(fontSize: 24),
                  ),
                  // Add more data you want to display here
                ],
              ),
      ),
    );
  }
}
