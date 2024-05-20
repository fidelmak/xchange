import 'package:http/http.dart' as http;
import 'dart:convert';

class MoralisService {
  final String apiKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6ImEzOWQ4MWZhLWIwODktNDdjNy1hMjViLWY1OGU5YzdhNjNhMSIsIm9yZ0lkIjoiMzkyODM2IiwidXNlcklkIjoiNDAzNjUwIiwidHlwZUlkIjoiOGJiNjQwNmEtNDg5OC00OWZiLWJjOTctNWNjNjQwNDBiNTk3IiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE3MTYxMDc4NDksImV4cCI6NDg3MTg2Nzg0OX0.b_GLg-1zhNVgN49Kqp8_5ahu-w_JymmuMtjMBmRmu84';
  final String baseUrl = 'https://deep-index.moralis.io/api/v2';

  Future<void> getSepoliaBalance(String address) async {
    final String chain = 'sepola'; // Sepolia Testnet chain ID
    final url = Uri.parse('$baseUrl/$address/balance?chain=$chain');

    try {
      final response = await http.get(
        url,
        headers: {
          'X-API-Key': apiKey,
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print(data);
        // Handle the data as needed
      } else {
        throw Exception('Failed to load balance');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
