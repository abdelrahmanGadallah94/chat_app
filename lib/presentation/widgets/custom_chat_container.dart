import 'package:flutter/material.dart';
import 'package:new_chat_app/presentation/utilities/app_colors.dart';
import 'package:sizer/sizer.dart';

// ignore: must_be_immutable
class ChatBubbleSender extends StatelessWidget {
   // MessagesModel message;
  String message;
  ChatBubbleSender({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: .7.h),
          padding:
              EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
          decoration: const BoxDecoration(
            color: AppColors.chatBubbleSenderColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Text(
            // message.messages,
             message,
            style: const TextStyle(color: AppColors.whiteColor,height: 1.5),
          ),
        ));
  }
}

// ignore: must_be_immutable
class ChatBubbleReceiver extends StatelessWidget {
  // MessagesModel message;
  String message;
  ChatBubbleReceiver({Key? key,required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 4.w, vertical: .7.h),
          padding:
          EdgeInsets.only(left: 3.w, right: 3.w, top: 2.h, bottom: 2.h),
          decoration: const BoxDecoration(
            color: AppColors.chatBubbleReceiverColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
            ),
          ),
          child: Text(
            // message.messages,
            message,
            style: const TextStyle(color: AppColors.whiteColor,height: 1.5),
          ),
        ));
  }
}
