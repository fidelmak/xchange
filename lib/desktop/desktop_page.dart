import 'package:flutter/material.dart';
import 'package:xchange/desktop/dashboard/price/cryto_screen.dart';
import 'package:xchange/mobile/const.dart';

class DesktopScreenLayout extends StatelessWidget {
  const DesktopScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;
    return Scaffold(
      bottomNavigationBar: Container(
        height: screenHeight * 0.2,
        child: BottomAppBar(
          color: Colors.black.withOpacity(0.99),
          child: Container(
              child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Xchange",
                            style: TextStyle(fontSize: 24, color: Colors.grey)),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          " About Us,   Contact Us ,  Trade. Customer's Service.",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      " CopyRight © 2024  Xchange. All Rights Reserved.",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          )),
        ),
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.transparent, // Simulates transparent background
                  foregroundColor: Colors.white, // Maintains text color
                ),
                child: Text("Xchange",
                    style: TextStyle(color: Colors.white, fontSize: 12)),
                onPressed: () {},
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Buy Crypto",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Trade",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "🔥 IEO",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                " 🔥 Defi",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                "Announcement Center",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              SizedBox(
                width: 30,
              ),
            ],
          ),
          actions: [
            Text(
              "Sign In",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                width: screenWidth * 0.08,
                decoration: BoxDecoration(
                  color: Colors.transparent, // Keeps background transparent
                  borderRadius: BorderRadius.circular(
                      5), // Set your desired corner radius
                  border: Border.all(
                      color: Colors.green, width: 2), // Optional border
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors
                            .transparent, // Simulates transparent background
                        foregroundColor: Colors.white, // Maintains text color
                      ),
                      child: Text("Register",
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 30,
            ),
            Text(
              "English",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            SizedBox(
              width: 30,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          children: [
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Find Your Next Moonshot",
                          style: TextStyle(color: Colors.black, fontSize: 35),
                        ),
                        Text("Hi Welcome to Atomic exchange",
                            style: TextStyle(color: Colors.black, fontSize: 35))
                      ],
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: 200,
                      width: screenWidth * 0.5,
                      child: Image.asset('assets/images/btc.jpg'),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.grey.shade100,
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Symbol",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Name",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "price USD",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Fluntuation Range",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Operation",
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
              ),
            ),
            Container(
                height: screenHeight * 9,
                width: screenWidth * 0.8,
                child: CryptoListScreen()),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  "loading... 1 2 3 ",
                  style: TextStyle(color: Colors.green, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// MobileLoginScreen(), MobileRegisterScreen()