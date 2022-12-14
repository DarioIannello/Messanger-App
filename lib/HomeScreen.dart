import 'package:flutter/material.dart';
import 'package:messangerapp/Methods.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat-App"),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => logout(context),
          child: const Text("Ausloggen"),
        ),
      ),
    );
  }
}
