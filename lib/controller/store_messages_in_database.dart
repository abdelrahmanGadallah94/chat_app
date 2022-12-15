import 'package:cloud_firestore/cloud_firestore.dart';

import '../presentation/utilities/app_strings.dart';
Future addMessages(String message, String id) async{
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages = FirebaseFirestore.instance.collection(AppString.storedMessages);

  return messages.add(
    {
      AppString.messageKey: message,
      AppString.createdAt: DateTime.now(),
      AppString.id: id,
    }
  );
}