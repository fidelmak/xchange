import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:xchange/mobile/user/provider/import_wallet.dart';
import 'package:xchange/mobile/user/provider/wallet_provider.dart';

import '../../main.dart';
import '../const.dart';
import '../screens/home_page.dart';
import '../widgets/bottom_bar.dart';
import '../widgets/my_app_bar.dart';
import 'provider/generate_phrase.dart';
import 'widgets/user_nav.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static String id = "Home";

  @override
  State<Home> createState() => _HomeState();
}

String getUserEmailFromSupabase(SupabaseClient supabase) {
  // Check if a user is signed in

  // Get the user object (handle potential errors)
  try {
    final user = supabase.auth.currentUser!.id;
    return user; // Use informative message
  } catch (error) {
    print("Error getting user email: $error");
    return "l o a d i n g..."; // Informative error message
  }
}

final supabase = SupabaseClient(supabaseUrl, supabaseKey);
final userEmail = getUserEmailFromSupabase(supabase);

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
      appBar: AppBar(
        title: UserNav(),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                    height: 100,
                    child: Image(image: AssetImage("assets/images/wall.jpg"))),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                userEmail,
                style: TextStyle(color: Colors.red, fontSize: 10),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GenerateMnemonicPage()),
                    );
                    //Navigator.pushNamed(context, GenerateMnemonicPage.id);
                    //WalletService().generateWallet();

                    // final mneumonic = WalletService().generateMnemonic();
                    // final privatekey =
                    //     await WalletService().getPrivateKey(mneumonic);
                    // final address =
                    //     await WalletService().getPublicKey(privatekey);
                    // //WalletProvider().getPublicKey(privatekey).toString();

                    // print(" text ${mneumonic}");
                    // print(" text ${address}");
                    // print("_* " * 10);
                    // final vari = WalletService().gen();
                    // print(vari);
                  },
                  child: Text("create a wallet")),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "import  wallet phrase",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
              )
            ],
          ),
        ),
      )),
    ));
  }
}
