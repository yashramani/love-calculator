import 'package:flutter/material.dart';

class CommonTextFormFeild extends StatelessWidget {

 final TextEditingController controller;
 final String hint;
 final Color focuscolor,fontcolor,hinttextColor,borderColor,cursorcolor;
 final double fontsize;

  CommonTextFormFeild({Key? key, required this.controller, required this.cursorcolor, required this.borderColor, required this.hint, required this.hinttextColor,required this.focuscolor, required this.fontsize,required this.fontcolor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(fontSize: fontsize,color: fontcolor),
      cursorColor: cursorcolor,
      textAlign: TextAlign.center,
      decoration:  InputDecoration(
        focusColor: focuscolor,
          errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(12.0)),
            borderSide:
            BorderSide(color: borderColor, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(12.0)),
            borderSide:
            BorderSide(color: borderColor, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(12.0)),
            borderSide:
            BorderSide(color: borderColor, width: 1.0),
          ),
          hintText: hint,
          hintStyle: TextStyle(color: hinttextColor)),
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter name';
        }
        return null;
      },
    );
  }
}
