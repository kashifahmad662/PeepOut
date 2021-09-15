import 'package:flutter/material.dart';

import '../../global.dart';


class RoundedButton extends StatefulWidget {
  String buttonName;
  RoundedButton({Key? key,required this.buttonName}) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          screenWidth * 0.15, 0.0, screenWidth * 0.15, 0.0),
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF7AD8F6),
              Colors.blue,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(25.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 10,
              offset: Offset(0, 3),
            )
          ]),
      child: Center(
        child: Text(
          widget.buttonName,
          textAlign: TextAlign.left,
          style: TextStyle(
            fontFamily: "Netflix",
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 0.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
