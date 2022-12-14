import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:messangerapp/Authenticator.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(ChatApp());
}


class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Authenticate(),
    );
  }
}
