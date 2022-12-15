import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../controller/sign_in_method.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_routes.dart';
import '../utilities/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_login_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? email;
  String? password;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldColor,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey,
              child: ListView(
                children: [
                  SizedBox(height: 10.h),
                  Image.asset(
                    AppString.logoLink,
                    height: 10.h,
                  ),
                  Center(
                    child: CustomText(
                      txt: AppString.logoTitle,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: AppString.fontFamily,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CustomText(
                        txt: AppString.signIn,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    textColor: AppColors.whiteColor,
                    enabledBorderColor: AppColors.whiteColor,
                    focusedBorderColor: AppColors.blueColor,
                    errorBorderColor: AppColors.errorColor,
                    hintColor: AppColors.whiteColor,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppString.canNotBeEmpty;
                      }
                      return null;
                    },
                    onChanged: (data) {
                      email = data;
                    },
                    hintText: AppString.email,
                    obscureText: false,
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    textColor: AppColors.whiteColor,
                    enabledBorderColor: AppColors.whiteColor,
                    focusedBorderColor: AppColors.blueColor,
                    errorBorderColor: AppColors.errorColor,
                    hintColor: AppColors.whiteColor,
                    validator: (data) {
                      if (data!.isEmpty) {
                        return AppString.canNotBeEmpty;
                      }
                      return null;
                    },
                    onChanged: (data) {
                      password = data;
                    },
                    hintText: AppString.password,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {

                        });
                         await signInByEmail(email: email!, password: password!, context: context,);
                        isLoading = false;
                        setState(() {

                        });
                      }
                    },
                    text: AppString.signIn,
                  ),
                  CustomTextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoutes.registerRoute);
                    },
                    text1: AppString.haveNoAccount,
                    text2: AppString.signUp,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
