

import 'package:flutter/services.dart';

class WalletConnect{
  /*
  * Creating Platform Channel to Revoke Methods at Android Level
  * */
  static const platform = const MethodChannel('peepout');
  /*
  * Revoking method at android level to start an Intend for various Crypto Wallet
  * and choose one to connect to Account
  * */
  void connectToWallet() async {
    String response = "Null";
    try {
      final String result = await platform.invokeMethod("connectWallet");
      response = result;
    } on PlatformException catch (e) {
      response = "Failed to Invoke: '${e.message}'.";
    }
  }

  /*
  * This method will call itself when the Screen resume after connecting to wallet
  * Getting Private Key of user after user has accepted from wallet
  * this method revoke method at android level
  * */
  Future<String> GetAccountPrivateKey() async {
    String? Address;
    try {
      final String result = await platform.invokeMethod("getWalletAddress");
      Address = result;
    } on PlatformException catch (e) {
      Address = "Null";
    }
    return Address.toString();


  }




}