import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_chat_app/presentation/screens/chat.dart';
import 'package:new_chat_app/presentation/screens/login.dart';
import 'package:new_chat_app/presentation/screens/register.dart';
import 'package:new_chat_app/presentation/utilities/app_routes.dart';
import 'package:sizer/sizer.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
       const ChatApp(),
  );
}

class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType){
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            AppRoutes.loginRoute: (context) => const LoginScreen(),
            AppRoutes.registerRoute: (context) =>  const RegisterScreen(),
            AppRoutes.chatRoute: (context) =>  ChatScreen(),
          },
          initialRoute: AppRoutes.loginRoute,
          // home: LoginScreen(),
        );
      },
    );
  }
}

