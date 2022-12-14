import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messangerapp/LoginScreen.dart';

Future<User?> createAccount(
    String name, String email, String password, String confirmPassword) async {

    FirebaseAuth _auth = FirebaseAuth.instance;

    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (password != confirmPassword) {
        print("Account konnte nicht erstellt werden!");
        return user;
      }
      if (user != null) {
        print("Account wurde erstellt!");
        return user;
      } else {
        print("Account konnte nicht erstellt werden!");
        return user;
      }
    } catch (e) {
      print(e);
      return null;
    }
}

Future<User?> login(String email, String password) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    User? user = (await _auth.signInWithEmailAndPassword(
            email: email, password: password))
        .user;
    if (user != null) {
      print("Login Erfolgreich!");
      return user;
    } else {
      print("Einloggen nicht möglich!");
      return user;
    }
  } catch (e) {
    print(e);
    return null;
  }
}

Future logout(BuildContext context) async {
  FirebaseAuth _auth = FirebaseAuth.instance;

  try {
    await _auth.signOut().then((user) {
      Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
    });
  } catch(e) {
    print("Ausloggen nicht möglich!");
  }
}
