import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
    home: Home()
));


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notenrechner'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple[400],
      ),
      body: Center(
        child: Text(
          'hello',
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            letterSpacing: 2.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('click'),
        backgroundColor: Colors.deepPurple[400],
      ),
    );
  }
}
