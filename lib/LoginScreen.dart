import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            alignment: Alignment.center,
            width: size.width / 1.2,
              child:  IconButton(
                  icon: const Icon(Icons.arrow_back), onPressed: () {})),
          SizedBox(
            height: size.height / 50,
          ),

          Container(
            width: size.width / 1.3,
            child: const Text(
              "Willkommen",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            width: size.width / 1.3,
            child: const Text(
              "Bitte anmelden!",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 25,
                fontWeight: FontWeight.w500, 
              ),
            ),
          ),
        ],
      ),
    );
  }
}
