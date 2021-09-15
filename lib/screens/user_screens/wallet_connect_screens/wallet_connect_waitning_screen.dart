import 'package:flutter/material.dart';
import 'package:peepout/screens/error_screens/user_public_key_not_fetch_error_screen.dart';
import 'package:peepout/screens/user_screens/profile_screens/register_new_user.dart';
import 'package:peepout/screens/user_screens/profile_screens/user_profile_screen.dart';
import 'package:peepout/utils/database_provieders/firestore_provider.dart';
import 'package:peepout/utils/widgets/button.dart';
import 'package:peepout/walletconnect/connect_wallet.dart';

class walletWaitingScreen extends StatefulWidget {
  WalletConnect walletConnect;
  walletWaitingScreen({Key? key, required this.walletConnect}) : super(key: key);

  @override
  _walletWaitingScreenState createState() => _walletWaitingScreenState();
}

class _walletWaitingScreenState extends State<walletWaitingScreen> {

  String ConnectedAccount = "null";
  fireStoreProvider _fireStore = fireStoreProvider();

  fetUserPublicKey()async{
    ConnectedAccount = await widget.walletConnect.GetAccountPrivateKey();
    if(ConnectedAccount=="null"){
      Navigator.push(context,
                MaterialPageRoute(builder: (context) => userKeyNotFetched()));
            //Remove it Later
            debugPrint("Something Went Wrong");
    }
    else {
      if(await _fireStore.userExists(ConnectedAccount)) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>userProfilePage(userPublicKey: ConnectedAccount)));
      }
      else{
        Navigator.push(context, MaterialPageRoute(builder: (context)=>userRegistration(UserPrivateKey: ConnectedAccount)));
      }

    }

    }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: GestureDetector(
          onTap: (){
            fetUserPublicKey();
          },
          child: RoundedButton(
            buttonName: 'Continue',
          ),
        ),
      ),
    );

  }
}
