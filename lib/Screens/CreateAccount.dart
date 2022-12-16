import 'package:flutter/material.dart';
import '../Authentication/Methods.dart';
import 'HomeScreen.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: isLoading
          ? Center(
              child: Container(
                height: size.height / 20,
                width: size.height / 20,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 20,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      width: size.width / 1.1,
                      child: IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {})),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: const Text(
                      "Willkommen",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: const Text(
                      "Jetzt Registrieren!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 50, right: 50, bottom: 0),
                    width: size.width / 1.1,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _name,
                      decoration: const InputDecoration(
                        hintText: "Name",
                        icon: Icon(Icons.abc),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _email,
                      decoration: const InputDecoration(
                        hintText: "E-Mail",
                        icon: Icon(Icons.account_box),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Passwort",
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Container(
                    width: size.width / 1.1,
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _confirmPassword,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Passwort Bestätigen",
                        icon: Icon(Icons.lock),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  customButton(size),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Text(
                      "Zurück zum Login",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }

  Widget customButton(Size size) {
    return GestureDetector(
      onTap: () {
        if (_name.text.isNotEmpty &&
            _email.text.isNotEmpty &&
            _password.text.isNotEmpty &&
            _confirmPassword.text.isNotEmpty) {
          setState(() {
            isLoading = true;
          });

          createAccount(context, _name.text, _email.text, _password.text,
                  _confirmPassword.text)
              .then((user) {
            if (user != null) {
              Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
            }
            setState(() {
              isLoading = false;
            });
          });
        } else {
          _showFailedRegistrationDialog();
        }
      },
      child: Container(
        height: size.height / 15,
        width: size.width / 1.1,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: const Text(
          "Registrieren",
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget field(Size size, String hintTextString, IconData iconData,
      TextEditingController controller) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.1,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(iconData),
          hintText: hintTextString,
          hintStyle: TextStyle(color: Colors.grey),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }

  Future<void> _showFailedRegistrationDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registrierung fehlgeschlagen!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Bitte füllen Sie alle Felder korrekt aus.'),
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
