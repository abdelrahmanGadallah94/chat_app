import 'package:new_chat_app/presentation/utilities/app_strings.dart';

class MessagesModel{
  final String messages;
  final String id;

  MessagesModel({required this.messages, required this.id});

  factory MessagesModel.fromJson(jsonData){
    return MessagesModel(
      messages: jsonData[AppString.messageKey],
      id: jsonData[AppString.id]
    );
  }
}