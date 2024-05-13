import 'package:cryptofont/cryptofont.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class CardRight extends StatelessWidget {
  const CardRight({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 380,
        width: screenSize.width * 0.4,
        color: cardColor,
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "GemBox",
                        style: TextStyle(color: Colors.blue),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(206, 255, 230, 0),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text("TOP1"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                Center(
                  child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Image(image: AssetImage("assets/images/eth.png"))),
                ),
                SizedBox(
                  height: 32,
                ),
                Text(
                  "ETH",
                  style: TextStyle(color: Colors.white),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 18,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "//////////",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          "2.5",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buy Crypto"),
                          Text("Visa, MasterCard")
                        ]),
                    Center(
                      child: SizedBox(
                          width: 20,
                          height: 20,
                          child: Image(
                              image: AssetImage("assets/images/btc.png"))),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
