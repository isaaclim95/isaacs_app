import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Container(
          child: Column(
            children: [
              RaisedButton(
                child: Text("login"),
                onPressed: model.login,
              )
            ],
          ),
        ),
      ),
    );
  }
}
