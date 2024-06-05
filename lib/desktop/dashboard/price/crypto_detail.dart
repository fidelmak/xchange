import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'crypto.dart';
import 'crypto_provider.dart';
import 'package:provider/provider.dart';

class CryptoDetailScreen extends StatelessWidget {
  final Crypto crypto;

  CryptoDetailScreen({required this.crypto});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CryptoProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(crypto.name),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: provider.fetchCryptoHistory(crypto.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text('Price: \$${crypto.currentPrice}',
                      style: TextStyle(fontSize: 12)),
                  Text('24h fluntuation: ${crypto.priceChangePercentage}%',
                      style: TextStyle(fontSize: 16)),
                  SizedBox(height: 20),
                  Expanded(
                    child: LineChart(
                      LineChartData(
                        lineBarsData: [
                          LineChartBarData(
                            spots: _createFlSpots(data),
                            isCurved: true,
                            barWidth: 2,
                            color: Colors.green,
                          ),
                        ],
                        titlesData: FlTitlesData(show: false),
                        borderData: FlBorderData(show: true),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Text("update"),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  List<FlSpot> _createFlSpots(List<dynamic> data) {
    return data.map((entry) {
      final time = DateTime.fromMillisecondsSinceEpoch(entry[0]);
      final price = entry[1].toDouble();
      return FlSpot(time.millisecondsSinceEpoch.toDouble(), price);
    }).toList();
  }

  List<BarChartGroupData> _createCandleSticks(List<dynamic> data) {
    List<BarChartGroupData> barGroups = [];

    for (int i = 0; i < data.length; i++) {
      final open = data[i][1];
      final close = data[i][1]; // Replace with actual close data if available
      final high = data[i][1]; // Replace with actual high data if available
      final low = data[i][1]; // Replace with actual low data if available

      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              fromY: high.toDouble(),
              color: Colors.green,
              rodStackItems: [
                BarChartRodStackItem(
                    low.toDouble(), open.toDouble(), Colors.red),
                BarChartRodStackItem(
                    open.toDouble(), close.toDouble(), Colors.green),
              ],
              toY: 0.2,
            ),
          ],
        ),
      );
    }

    return barGroups;
  }
}
