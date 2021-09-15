import 'package:flutter/material.dart';

class userKeyNotFetched extends StatelessWidget {
  const userKeyNotFetched({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Text("Something went wrong please try again"),
        ),
      ),
    );
  }
}
