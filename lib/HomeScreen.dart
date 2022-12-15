import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Methods.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic>? userMap;
  bool isLoading = false;
  final TextEditingController _search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    void onSearch() async {
      FirebaseFirestore _firestrore = FirebaseFirestore.instance;

      setState(() {
        isLoading = true;
      });

      await _firestrore
          .collection("users")
          .where("name", isEqualTo: _search.text)
          .get()
          .then((value) {

        setState(() {
          userMap = value.docs[0].data();
          isLoading = false;
        });
        print(userMap);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat-App"),
        actions: [
          IconButton(onPressed: () => logout(context), icon: const Icon(Icons.logout))
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
                    onTap: () {},
                    leading: const Icon(Icons.account_box, color: Colors.black),
                    title: Text(
                      userMap!["name"],
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(userMap!["email"]),
                    trailing: const Icon(Icons.chat, color: Colors.black),
                  )
                else
                  Container(),
              ],
            ),
    );
  }
}
