import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';

class CustomButton extends StatelessWidget {
  String text;
  VoidCallback ? onTap;
  CustomButton({Key? key,required this.text,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(text,style: TextStyle(
            color: AppColors.scaffoldColor,
            fontSize: 18,
            fontWeight: FontWeight.w500
        ),),
      ),
    );
  }
}
