import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Authentication/Methods.dart';
import 'ChatRoom.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();

  String chatRoomId(String user1, String user2, String mail1, String mail2) {
    if (user1.toLowerCase().codeUnits.length >
        user2.toLowerCase().codeUnits.length) {
      return "$mail1$mail2";
    } else {
      return "$mail2$mail1";
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    FirebaseAuth _auth = FirebaseAuth.instance;

    void onSearch() async {
      FirebaseFirestore _firestrore = FirebaseFirestore.instance;

      setState(() {
        isLoading = true;
      });

      try {
        await _firestrore
            .collection("users")
            .where("name", isEqualTo: _search.text)
            .get()
            .then((value) {
          setState(() {
            userMap = value.docs[0].data();
          });
        });
      } catch (e) {
        _showUserNotFoundDialog();
      }
      setState(() {
        isLoading = false;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat-App"),
        actions: [
          IconButton(
              onPressed: () => logout(context), icon: const Icon(Icons.logout))
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 14,
                  width: size.width,
                  alignment: Alignment.center,
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.1,
                    child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Suchen",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 30,
                ),
                ElevatedButton(
                    onPressed: onSearch, child: const Text("Suchen")),
                SizedBox(
                  height: size.height / 50,
                ),
                if (userMap != null)
                  ListTile(
                    onTap: () {
                      String roomId = chatRoomId(
                          _auth.currentUser!.displayName!,
                          userMap!["name"],
                          _auth.currentUser!.email!,
                          userMap!["email"]);

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => ChatRoom(
                            chatRoomId: roomId,
                            userMap: userMap,
                          ),
                        ),
                      );
                    },
                    leading: Icon(Icons.account_box, color: Colors.black),
                    title: Text(
                      userMap!['name'],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(userMap!['email']),
                    trailing: Icon(Icons.chat, color: Colors.black),
                  )
                else
                  Container(),
              ],
            ),
    );
  }

  Future<void> _showUserNotFoundDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Benutzer nicht gefunden!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Dieser Benutzer existiert nicht.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
