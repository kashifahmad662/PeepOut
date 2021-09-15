import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:peepout/global.dart';
import 'package:peepout/utils/widgets/user_page_peep-style.dart';

class userProfilePage extends StatefulWidget {
  String userPublicKey;

  userProfilePage({Key? key, required this.userPublicKey}) : super(key: key);

  @override
  _userProfilePageState createState() => _userProfilePageState();
}

class _userProfilePageState extends State<userProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 50.0,
              ),
              Row(children: [
                /*
                    * User Profile Picture
                    * */
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.07),
                  child: CircleAvatar(
                    child: Icon(
                      Icons.account_circle,
                      size: screenWidth * 0.3,
                    ),
                    radius: screenWidth * 0.3 / 2,
                    backgroundColor: Colors.grey,
                  ),
                ),

                /*
                    * Username fetched from database
                    * */
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06),
                  child: Column(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(top: screenHeight * 0.06),
                          child: Container(
                              width: screenWidth * 0.55,
                              child: Text(
                                "Robert Douglas",
                                style: userNameStyle,
                              ))),
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.005),
                        child: Container(
                            width: screenWidth * 0.55,
                            child: Text(
                              widget.userPublicKey,
                              style: TextStyle(color: Colors.grey),
                            )),
                      )
                    ],
                  ),
                ),
              ]),
              SizedBox(
                height: screenHeight * 0.05,
              ),

              /*
                      * User Peep related Credentials
                      * */
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  profilePeepUI(
                      startingLogo: CupertinoIcons.square_stack_3d_up,
                      peepText: "23.2k peep",
                      peepInfo: "peep size",
                      uiColor: Colors.blue),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  profilePeepUI(
                      startingLogo: CupertinoIcons.lock,
                      peepText: "1K - 5k peep",
                      peepInfo: "staking range",
                      uiColor: Colors.purple.shade700),
                  SizedBox(
                    width: screenWidth * 0.03,
                  )
                ],
              ),
              SizedBox(
                height: screenHeight * 0.015,
              ),
              Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  profilePeepUI(
                      startingLogo: CupertinoIcons.command,
                      peepText: "5.3% APY",
                      peepInfo: "21 days left",
                      uiColor: Colors.green),
                  SizedBox(
                    width: screenWidth * 0.03,
                  ),
                  profilePeepUI(
                      startingLogo: CupertinoIcons.bag,
                      peepText: "80% reward",
                      peepInfo: "pool distribution",
                      uiColor: Colors.orange),
                  SizedBox(
                    width: screenWidth * 0.03,
                  )
                ],
              ),

              /*
                  * User Details fetched from dataBase
                  *
                  * */
              SizedBox(height: screenHeight * 0.035,),
              Container(
                width: screenWidth,
                margin: EdgeInsets.only(
                    top: screenHeight * 0.001,
                    bottom: screenHeight * 0.001,
                    left: screenWidth * 0.03,
                    right: screenWidth * 0.03),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(0, 3),
                    )
                  ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      child: Text(
                        "Details",
                        style: TextStyle(
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: screenWidth * 0.05,right: screenWidth * 0.05,bottom: screenWidth * 0.05),
                        child: Text(
                      "Robert Douglas Thomas Pattinson (born 13 May 1986) is an English actor. Starring in both big-budget and independent films, Pattinson has been ranked among the world's highest-paid actors. Time magazine named him one of the 100 most influential people in the world, and he was featured in the Forbes Celebrity 100 list After starting to act in a London theatre club at age 15",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.black.withOpacity(0.5)),
                    ))
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
