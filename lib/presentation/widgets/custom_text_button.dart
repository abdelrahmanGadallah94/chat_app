import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

// ignore: must_be_immutable
class CustomTextButton extends StatelessWidget {
  Function()? onPressed;
  String text1;
  String text2;
  CustomTextButton(
      {Key? key,
      required this.onPressed,
      required this.text1,
      required this.text2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: Text(text1,style: const TextStyle(
          color: AppColors.whiteColor
        ),),
        label: Text(text2,style: const TextStyle(
          color: AppColors.signUpColor
        ),));
  }
}
