import 'dart:math';

import 'package:web3dart/crypto.dart';
import 'package:web3dart/web3dart.dart';
import 'package:flutter/foundation.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:ed25519_hd_key/ed25519_hd_key.dart';
import 'package:hex/hex.dart';
import 'package:shared_preferences/shared_preferences.dart';

// abstract class WalletAddressServices {
//   String generateMnemonic();
//   Future<String> getPrivateKey(String mnemonic);
//   Future<EthereumAddress> getPublicKey(String privateKey);
// }

// class WalletService extends ChangeNotifier implements WalletAddressService {
//   String? privateKey;
//   // Load the private key from the shared preferences
//   Future<void> loadPrivateKey() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     privateKey = prefs.getString('privateKey');
//   }

//   // set the private key in the shared preferences
//   Future<void> setPrivateKey(String privateKey) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('privateKey', privateKey);
//     this.privateKey = privateKey;
//     notifyListeners();
//   }

//   // Future<void> generateWallet() async {
//   //   // Generate a new mnemonic
//   //   String mnemonic = bip39.generateMnemonic();

//   //   // Seed from mnemonic
//   //   var seed = bip39.mnemonicToSeed(mnemonic);

//   //   // Generate a private key from the seed
//   //   EthPrivateKey privateKey =
//   //       EthPrivateKey.fromHex(bytesToHex(seed.sublist(0, 32)));

//   //   // Get the corresponding public address
//   //   EthereumAddress address = await privateKey.extractAddress();
//   //   print("mnemonic ${mnemonic}");
//   //   print("privateKey ${bytesToHex(privateKey.privateKey)}");
//   //   print("address ${address.hex}");
//   // }

//   // Future<void> gen() async {
//   //   String mnemonic =
//   //       "test brown maple surface crumble frequent fortune nephew night dune trim exclude";
//   //   Uint8List seed = bip39.mnemonicToSeed(mnemonic);
//   //   // Generate the private key using
//   //   final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
//   //   final privateKey = HEX.encode(master.key);
//   //   final private = EthPrivateKey.fromHex(privateKey);
//   //   final address = private.address;
//   //   //0x8718df2c82e4cdba40d5a36bdbcd104c04333814

//   //   // print(seed);
//   //   // print(address);
//   // }

//   @override
//   String generateMnemonic() {
//     return bip39.generateMnemonic();
//   }

//   @override
//   Future<String> getPrivateKey(String mnemonic) async {
//     final seed = bip39.mnemonicToSeed(mnemonic);
//     final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
//     final privateKey = HEX.encode(master.key);

//     // Set the private key in the shared preferences
//     await setPrivateKey(privateKey);
//     return privateKey;
//   }

//   @override
//   Future<EthereumAddress> getPublicKey(String privateKey) async {
//     final private = EthPrivateKey.fromHex(privateKey);
//     final address = private.address;
//     return address;
//   }
// }

abstract class WalletAddressService {
  String generateMnemonic();
  Future<String> getPrivateKey(String mnemonic);
  Future<EthereumAddress> getPublicKey(String privateKey);
}

class WalletProvider extends ChangeNotifier implements WalletAddressService {
  // Variable to store the private key
  String? privateKey;

  // Load the private key from the shared preferences
  Future<void> loadPrivateKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    privateKey = prefs.getString('privateKey');
  }

  // set the private key in the shared preferences
  Future<void> setPrivateKey(String privateKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('privateKey', privateKey);
    this.privateKey = privateKey;
    notifyListeners();
  }

  @override
  String generateMnemonic() {
    return bip39.generateMnemonic();
  }

  @override
  Future<String> getPrivateKey(String mnemonic) async {
    final seed = bip39.mnemonicToSeed(mnemonic);
    final master = await ED25519_HD_KEY.getMasterKeyFromSeed(seed);
    final privateKey = HEX.encode(master.key);

    // Set the private key in the shared preferences
    await setPrivateKey(privateKey);
    variables.add(mnemonic);
    return privateKey;
  }

  @override
  Future<EthereumAddress> getPublicKey(String privateKey) async {
    final private = EthPrivateKey.fromHex(privateKey);
    final address = await private.address;
    variables.add(address);
    print(address);
    return address;
  }

  List<dynamic> variables = [];
}
