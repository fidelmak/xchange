import 'package:flutter/material.dart';

import '../const.dart';

class CardTag extends StatelessWidget {
  const CardTag({super.key});

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
                        "Newest",
                        style: TextStyle(color: Colors.yellow),
                      ),
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text("Featured"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Exclusively for futures ",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Newbies:",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Text(
                          "up to ",
                          style: TextStyle(color: Colors.green),
                        ),
                        Text(
                          "1000 USDT",
                          style: TextStyle(color: Colors.yellow),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Bonuses for Everyone!",
                      style: TextStyle(color: Colors.green),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.green, // Set background color to green
                        borderRadius: BorderRadius.circular(
                            20), // Set border radius to 20
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'GO',
                            style: TextStyle(color: Colors.black),
                          ),
                          Icon(
                            Icons.arrow_circle_right,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: SizedBox(
                          width: 200,
                          height: 150,
                          child: Image(
                              image: AssetImage("assets/images/nft2.png"))),
                    )
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
