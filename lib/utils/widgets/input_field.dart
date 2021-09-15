import 'package:flutter/material.dart';
import 'package:peepout/utils/provider/providers.dart';
import 'package:peepout/utils/provider/providers.dart';
import '../../global.dart';
import 'package:provider/provider.dart';

class PasswordInput extends StatelessWidget {
  final String hint;




   PasswordInput({
    Key ?key,
    required this.hint,
  }) : super(key: key);

  TextEditingController _textEditingController = new TextEditingController();


   FocusNode _focus = new FocusNode();

  String getData(){
   return _textEditingController.text;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            (_focus.hasFocus)?BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              offset: Offset(0.0, 4), //(x,y)
              blurRadius: 0.0,
            ):BoxShadow(
              color: Colors.transparent
            )
          ],
          color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15.0))
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
                padding: EdgeInsets.only(left:15.0,right: 10.0),
                child: TextField(
                  onChanged: (String value){
                    context.read<valueProvider>().firstName(value);
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: _focus,
                  controller: _textEditingController,
                  textAlign: TextAlign.left,
                  cursorColor: Color(0xffcdcdcd),
                  cursorRadius: Radius.circular(10.0),
                  cursorWidth: 2.5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: TextStyle(color: Colors.black54,fontSize: 18),
                  ),
                  style: TextStyle(color: Colors.black87.withOpacity(0.7),fontSize: 19.0),
                ),
              ),
      ),

    );
  }
}