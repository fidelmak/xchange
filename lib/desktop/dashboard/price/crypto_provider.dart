import 'package:flutter/material.dart';
import 'crypto_service.dart';
import 'crypto.dart';

class CryptoProvider with ChangeNotifier {
  List<Crypto> _cryptos = [];
  bool _isLoading = false;

  List<Crypto> get cryptos => _cryptos;
  bool get isLoading => _isLoading;

  CryptoProvider() {
    fetchCryptos();
  }

  Future<void> fetchCryptos() async {
    _isLoading = true;
    notifyListeners();

    final service = CryptoService();
    final data = await service.fetchCryptos();
    _cryptos = data.map((json) => Crypto.fromJson(json)).toList();

    _isLoading = false;
    notifyListeners();
  }

  Future<List<dynamic>> fetchCryptoHistory(String id) async {
    final service = CryptoService();
    return await service.fetchCryptoHistory(id);
  }
}
