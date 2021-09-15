import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:peepout/global.dart';
import 'package:peepout/screens/error_screens/user_public_key_not_fetch_error_screen.dart';
import 'package:peepout/screens/user_screens/wallet_connect_screens/wallet_connect_waitning_screen.dart';
import 'package:peepout/utils/LifeCycleHandler.dart';
import 'package:peepout/utils/database_provieders/firestore_provider.dart';
import 'package:peepout/utils/widgets/button.dart';
import 'package:peepout/walletconnect/connect_wallet.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  WalletConnect _walletConnect = WalletConnect();
  //TODO:Create Screen For Login And Register






  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    /*
    * Handle Application pause and resume Methods to fetch Address from Connected Account
    * */
    // WidgetsBinding.instance
    //     ?.addObserver(LifecycleEventHandler(resumeCallBack: () async {
    //   setState(() {
    //     //Calling GetAccountPrivateKey Method when the App Resume
    //     ConnectedAccount = _walletConnect.GetAccountPrivateKey().toString();
    //   });
    // }));
  }

  @override
  Widget build(BuildContext context) {
    // if(ConnectedAccount=="null"){
    //   Navigator.push(context,
    //             MaterialPageRoute(builder: (context) => userKeyNotFetched()));
    //
    // }
    // else {
    //   bool userExists =  ;
    // }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 0.0,
      ),
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Column(
          children: [
            Container(
                height: screenWidth * 0.5,
                width: screenWidth * 0.5,
                child: Image.asset(
                  'images/walletconnect.png',
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Container(
                            height: screenWidth * 0.25,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 10,
                                    offset: Offset(0, 15),
                                  )
                                ]),
                            child: Center(
                              child: Image.asset(
                                'images/metamask.png',
                                height: screenWidth * 0.25,
                                width: screenWidth * 0.25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Text(
                            'trustwallet',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Container(
                            height: screenWidth * 0.25,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 10,
                                    offset: Offset(0, 15),
                                  )
                                ]),
                            child: Center(
                              child: Image.asset(
                                'images/rainbow.png',
                                height: screenWidth * 0.25,
                                width: screenWidth * 0.25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Text(
                            'MetaMask',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Container(
                            height: screenWidth * 0.25,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 10,
                                    offset: Offset(0, 15),
                                  )
                                ]),
                            child: Center(
                              child: Image.asset(
                                'images/cryptocom.png',
                                height: screenWidth * 0.25,
                                width: screenWidth * 0.25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Text(
                            'MetaMask',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Container(
                            height: screenWidth * 0.25,
                            width: screenWidth * 0.25,
                            decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(100.0),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 10,
                                    offset: Offset(0, 15),
                                  )
                                ]),
                            child: Center(
                              child: Image.asset(
                                'images/trustwallet.png',
                                height: screenWidth * 0.25,
                                width: screenWidth * 0.25,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenWidth * 0.02,
                              left: screenWidth * 0.06),
                          child: Text(
                            'MetaMask',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: "Netflix",
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              letterSpacing: 0.5,
                              color: Colors.black45,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                /*
                  * Calling ConnectToWallet method to start intent
                  * */
                _walletConnect.connectToWallet();
                Navigator.push(context, MaterialPageRoute(builder: (context)=>walletWaitingScreen(walletConnect: _walletConnect,)));


              },
              child: RoundedButton(buttonName: "Connect"),
            ),
          ],
        ),
      ),
    );
  }
}
