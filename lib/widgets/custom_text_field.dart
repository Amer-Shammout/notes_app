// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
   const CustomTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.flag = false,
    this.textInputType,
    this.maxLines = 1,
     this.onSaved,
  });

  final String hint;
  final Function(String)? onChanged; 
  final bool flag;
  final int maxLines;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      validator: (value){
        if(value?.isEmpty ?? true){
          return "Field is required";
        } else{
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      maxLines: maxLines,
      keyboardType: textInputType,
      obscureText: flag,
      onChanged: onChanged, 
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(color: kPrimaryColor),
        hintText: hint,
        hintStyle: TextStyle(
          color: kPrimaryColor,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
