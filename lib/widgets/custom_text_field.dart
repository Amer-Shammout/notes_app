import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
   CustomTextField({
    super.key,
    required this.hint,
    this.onChanged,
    this.flag = false,
    this.textInputType,
    this.maxLines = 1,
  });

  final String hint;
  Function(String)? onChanged;
  final bool flag;
  final int maxLines;
 TextInputType? textInputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
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
