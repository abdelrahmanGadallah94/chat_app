import 'package:flutter/material.dart';

import '../presentation/utilities/app_colors.dart';

showSnackBar(BuildContext context, String text,Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,textAlign: TextAlign.center,),
      backgroundColor: color,
    ),
  );
}