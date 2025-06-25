import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Back to login")
          ),
          ElevatedButton(
              onPressed: () {

              },
              child: Text("Open Home")
          )
        ],
      ),
    );
  }
}
