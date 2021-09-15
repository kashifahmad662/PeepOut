import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../global.dart';

class profilePeepUI extends StatefulWidget {
  IconData startingLogo;
  String peepText;
  String peepInfo;
  Color uiColor;
  
  profilePeepUI({Key? key,
  required this.startingLogo,
    required this.peepText,
    required this.peepInfo,
    required this.uiColor
  }) : super(key: key);

  @override
  _profilePeepUIState createState() => _profilePeepUIState();
}

class _profilePeepUIState extends State<profilePeepUI> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(

        height: screenHeight * 0.07,
        decoration: BoxDecoration(
            color: widget.uiColor.withOpacity(0.2),
            borderRadius:
            BorderRadius.all(Radius.circular(15.0))),
        child: Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.02,
                    right: screenWidth * 0.02),
                child: CircleAvatar(
                    backgroundColor: widget.uiColor,
                    child: Icon(
                      widget.startingLogo,
                      size: screenWidth * 0.06,
                      color: Colors.white,
                    ))),
            Padding(
              padding: EdgeInsets.only(top: screenHeight*0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                      child: Text(
                        widget.peepText,
                        style: TextStyle(
                            color: widget.uiColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                        ),
                      )),
                  Center(child: Text(widget.peepInfo,style: TextStyle(color: Colors.grey.withOpacity(0.7),fontSize: 12.0),)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
