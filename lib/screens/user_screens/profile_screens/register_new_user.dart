
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:peepout/global.dart';
import 'package:peepout/model/user_model.dart';
import 'package:peepout/utils/database_provieders/firestore_provider.dart';
import 'package:peepout/utils/provider/providers.dart';
import 'package:peepout/utils/widgets/input_field.dart';
import 'package:peepout/utils/widgets/text_input_field.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peepout/utils/widgets/button.dart';
import 'package:provider/provider.dart';

class userRegistration extends StatefulWidget {
  String UserPrivateKey;

  userRegistration({Key? key, required this.UserPrivateKey}) : super(key: key);

  @override
  _userRegistrationState createState() => _userRegistrationState();
}

class _userRegistrationState extends State<userRegistration> {
  String firstName = "null";
  String lastName = "null";
  String profilePicURL = "null";
  String userBio = "null";
  String earningDistribution = "null";
  String Gender = "null";

  PasswordInput UserFirstName = new PasswordInput(
    hint: "First Name",
  );
  PasswordInput UserLastName = new PasswordInput(
    hint: "Last Name",
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
        child: Center(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 100.0,
            ),
            Container(
                height: screenHeight * 0.065,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.1, right: screenWidth * 0.1),
                child: UserFirstName.build(context)),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Container(
                height: screenHeight * 0.065,
                margin: EdgeInsets.only(
                    left: screenWidth * 0.1, right: screenWidth * 0.1),
                child: UserLastName.build(context)),
          ],
        ),
        floatingActionButton: Container(
          height: screenHeight * 0.065,
          child: FloatingActionButton(
            highlightElevation: 0.0,
            focusElevation: 0.0,
            elevation: 0.0,
            disabledElevation: 0.0,


            onPressed: () {
              if (UserFirstName.getData().isEmpty ||
                  UserLastName.getData().isEmpty) {
                debugPrint("Kashif Null");
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                        "All field is mandatory.Please provide proper details"),backgroundColor: Colors.black.withOpacity(0.7),elevation: 0.0,));
              }
            },
            child: Icon(
              CupertinoIcons.right_chevron,
              color: Colors.white,
              size: screenHeight * 0.04,
            ),
            backgroundColor: (context.watch<valueProvider>().firstname == "null" ||
                    UserLastName.getData().isEmpty)
                ? Colors.black.withOpacity(0.2)
                : Colors.black.withOpacity(0.8),
          ),
        ),
      ),
    ));
  }

  void _RegisterNewUser() {
    fireStoreProvider firestoreprovider = fireStoreProvider();
    firestoreprovider.registerUser(userModel(
        name: "Kashif",
        publickey: widget.UserPrivateKey,
        profilepicurl: "Http://Kashif.jpg",
        followers: "0",
        following: "1",
        poolsize: "23.8K",
        stakerange: "1K - 5K peep",
        apy: "5.3% APY",
        rewardpercentage: "80% APY",
        gender: "Male",
        bio: "Kashif Ahmad"));
  }
}
