import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_chat_app/presentation/utilities/app_strings.dart';

//1- one time read
/**
 * Future<QuerySnapshot> readMessages() async{
    CollectionReference messages = FirebaseFirestore.instance.collection(AppString.storedMessages);
    var message =  await messages.get();
    return message;
    }
 *
 */

// 2- realtime changes

Stream<QuerySnapshot> readMessages(){
  CollectionReference messages = FirebaseFirestore.instance.collection(AppString.storedMessages);
  return messages.orderBy(AppString.createdAt,descending: true).snapshots();
}