import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'dart:io';

class LoginView extends StatelessWidget {
  static bool isAndroid;

  LoginView() {
    if (Platform.isAndroid) {
      isAndroid = true;
    } else if (Platform.isIOS) {
      isAndroid = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(model.title),
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
              child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 35),
                      ),
                    ),
                    SizedBox(height: 100),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: isAndroid
                          ? TextFormField(
                        controller: model.emailController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ),
                      )
                          : CupertinoTextField(
                        placeholder: 'Email',
                        controller: model.emailController,
                        obscureText: false,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: isAndroid
                          ? TextFormField(
                        controller: model.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      )
                          : CupertinoTextField(
                        controller: model.passwordController,
                        placeholder: 'Password',
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: PlatformButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.grey[100],
                          child:
                          Text("Login", style: TextStyle(color: Colors.blue)),
                          onPressed: model.login,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: PlatformButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.grey[100],
                          child: Text("Register",
                              style: TextStyle(color: Colors.blue)),
                          onPressed: () => model.goToRegisterView(),
                        ),
                      ),
                    ),
                    model.isBusy
                        ? (isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator())
                        : Center(child: Container()),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
