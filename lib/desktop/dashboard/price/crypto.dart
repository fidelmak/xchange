class Crypto {
  final String id;
  final String name;
  final String symbol;
  final String imageUrl;
  final double currentPrice;
  final double priceChangePercentage;

  Crypto({
    required this.id,
    required this.name,
    required this.symbol,
    required this.imageUrl,
    required this.currentPrice,
    required this.priceChangePercentage,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      id: json['id'],
      name: json['name'],
      symbol: json['symbol'],
      imageUrl: json['image'],
      currentPrice: json['current_price'].toDouble(),
      priceChangePercentage: json['price_change_percentage_24h'].toDouble(),
    );
  }
}
