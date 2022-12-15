import 'package:flutter/material.dart';

import '../utilities/app_colors.dart';
import '../utilities/app_strings.dart';

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String txt;
  double fontSize;
  FontWeight? fontWeight;
  String ?fontFamily;
   CustomText({Key? key,required this.txt,required this.fontSize,this.fontWeight,this.fontFamily}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
        txt,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }
}
