import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/behaviour/behaviour.dart';
import 'package:isaacs_app/ui/models/login_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:isaacs_app/constants/globals.dart' as globals;

class LoginView extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(context),
      builder: (context, model, child) => PlatformScaffold(
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: ScrollConfiguration(
            behavior: ScrollViewBehavior(),
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                  child: Column(children: [
                    SizedBox(height: 35),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Log In",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                    SizedBox(height: 40),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            "Email",
                            style: TextStyle(color: Colors.grey),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: globals.isAndroid
                          ? Container(
                              height: 50,
                              child: TextFormField(
                                controller: model.emailController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            )
                          : CupertinoTextField(
                            controller: model.emailController,
                            obscureText: false,
                            suffix: CupertinoButton(
                                child: Icon(null),
                                onPressed: () => model.obscure()),
                          ),
                    ),
                    SizedBox(height: 5),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text("Password",
                              style: TextStyle(color: Colors.grey)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: globals.isAndroid
                          ? Container(
                              height: 50,
                              child: TextFormField(
                                controller: model.passwordController,
                                obscureText: model.obscureText,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.remove_red_eye),
                                    onPressed: () => model.obscure(),
                                  ),
                                ),
                              ),
                            )
                          : CupertinoTextField(
                            controller: model.passwordController,
                            obscureText: model.obscureText,
                            suffix: CupertinoButton(
                                child: Icon(Icons.remove_red_eye),
                                onPressed: () => model.obscure()),
                          ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: PlatformButton(
                          color: Colors.blue[700],
                          padding: EdgeInsets.all(0.0),
                          child: Text("Login",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            model.login();
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 90,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: PlatformButton(
                          color: Colors.blue[700],
                          padding: EdgeInsets.all(0.0),
                          child: Text("Register",
                              style: TextStyle(color: Colors.white)),
                          onPressed: () => model.goToRegisterView(),
                        ),
                      ),
                    ),
                    model.isBusy
                        ? (globals.isAndroid
                        ? CircularProgressIndicator()
                        : CupertinoActivityIndicator())
                        : Container(),
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
