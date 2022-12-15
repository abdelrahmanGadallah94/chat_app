import 'package:flutter/material.dart';
import 'package:new_chat_app/presentation/utilities/app_strings.dart';
import 'package:sizer/sizer.dart';

import '../../controller/read_messages.dart';
import '../../controller/store_messages_in_database.dart';
import '../../modal/messages_model.dart';
import '../utilities/app_colors.dart';
import '../widgets/custom_chat_container.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  ChatScreen({Key? key}) : super(key: key);

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppString.logoLink,
              height: 8.h,
            ),
            Text(AppString.chat),
          ],
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: readMessages(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<MessagesModel> messagesList = [];
            for (int i = 0; i < snapshot.data!.docs.length; i++) {
              messagesList.add(MessagesModel.fromJson(snapshot.data!.docs[i]));
            }
            return Column(
              children: [
                Expanded(
                    flex: 7,
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      itemCount: snapshot.data!.docs.length,
                      // itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        // return CustomChatContainer(message: messagesList[index]);
                        return messagesList[index].id == email
                            ? ChatBubbleSender(
                                message: snapshot.data!.docs[index]
                                    [AppString.messageKey])
                            : ChatBubbleReceiver(
                                message: snapshot.data!.docs[index]
                                    [AppString.messageKey]);
                      },
                    ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: TextField(
                    autofocus: true,
                    controller: controller,
                    onSubmitted: (data) async {
                      await addMessages(data, email);
                      controller.clear();
                      scrollController.animateTo(
                        0,
                        duration: const Duration(microseconds: 500),
                        curve: Curves.linear,
                      );
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.scaffoldColor),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: AppColors.blueColor,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        suffixIcon: const Icon(
                          Icons.send,
                          color: AppColors.scaffoldColor,
                        ),
                        hintText: AppString.sendMessage),
                  ),
                )
              ],
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
