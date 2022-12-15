import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_app/controller/show_snack_bar.dart';
import 'package:new_chat_app/presentation/utilities/app_strings.dart';

import '../presentation/utilities/app_colors.dart';
import '../presentation/utilities/app_routes.dart';

signInByEmail(
    {required String email,
    required String password,
    required BuildContext context}) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  try {
    UserCredential user =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, AppRoutes.chatRoute,arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == "user-not-found") {
      showSnackBar(context, AppString.noUserFound,AppColors.errorColor);
    } else if (e.code == "wrong-password") {
      showSnackBar(context, AppString.wrongPassword,AppColors.errorColor);
    }
  }
}

