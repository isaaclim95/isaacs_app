import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              child: Text("login"),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
