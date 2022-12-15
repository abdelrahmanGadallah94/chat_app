import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  String hintText;
  IconButton? suffixIcon;
  bool obscureText = false;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  Color hintColor;
  InputBorder? border;
  Color enabledBorderColor;
  Color focusedBorderColor;
  Color errorBorderColor;
  Color textColor;
  CustomTextField(
      {Key? key,
        required this.textColor,
      required this.enabledBorderColor,
      required this.focusedBorderColor,
      required this.errorBorderColor,
      this.border,
      required this.hintColor,
      required this.hintText,
      this.suffixIcon,
      required this.obscureText,
      this.onChanged,
      this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onChanged: onChanged,
      style: TextStyle(color: textColor),
      obscureText: obscureText,
      decoration: InputDecoration(
        border: border,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: TextStyle(
          color: hintColor,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor),
        ),
      ),
    );
  }
}
