import 'dart:convert';
import 'package:http/http.dart' as http;

class CryptoService {
  static const String apiUrl = 'https://api.coingecko.com/api/v3/coins/markets';
  static const String vsCurrency = 'usd';

  Future<List<dynamic>> fetchCryptos() async {
    final response =
        await http.get(Uri.parse('$apiUrl?vs_currency=$vsCurrency'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load cryptos');
    }
  }

  Future<List<dynamic>> fetchCryptoHistory(String id) async {
    final response = await http.get(Uri.parse(
        'https://api.coingecko.com/api/v3/coins/$id/market_chart?vs_currency=$vsCurrency&days=7'));

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['prices'];
    } else {
      throw Exception('Failed to load crypto history');
    }
  }
}
