import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_app/controller/show_snack_bar.dart';

import '../presentation/utilities/app_colors.dart';
import '../presentation/utilities/app_routes.dart';
import '../presentation/utilities/app_strings.dart';

registerByEmailAndPassword(
    String email, String password, BuildContext context) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  try {
    UserCredential users = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
    );
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.chatRoute,arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == "weak-password") {
      showSnackBar(context, AppString.weakPassword, AppColors.errorColor);
    } else if (e.code == "email-already-in-use") {
      showSnackBar(context, AppString.emailAlreadyInUse, AppColors.errorColor);
    }
  }
}
