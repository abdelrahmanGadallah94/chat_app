import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../controller/register_method.dart';
import '../utilities/app_colors.dart';
import '../utilities/app_strings.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String? email;
  String? password;

  GlobalKey<FormState> formKey = GlobalKey();

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
                      txt: AppString.signUp,
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
                  hintText: AppString.name,
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
                      email = data;
                    },
                    hintText: AppString.email,
                    obscureText: false),
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
                      setState(() {});
                      await registerByEmailAndPassword(
                          email!, password!, context);
                      isLoading = false;
                      setState(() {});
                    }
                  },
                  text: AppString.signUp,
                ),
                CustomTextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(
                    //       builder: (context) => const LoginScreen(),
                    //     ),
                    // );
                  },
                  text1: AppString.alreadyHaveAnAccount,
                  text2: AppString.signIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
