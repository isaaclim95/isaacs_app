import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/ui/models/register_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:isaacs_app/constants/globals.dart' as globals;


class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
        builder: (context, model, child) =>
            PlatformScaffold(
              appBar: PlatformAppBar(),
              body: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  FocusScope.of(context).requestFocus(new FocusNode());
                },
                child: Container(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          PlatformButton(
                            child: Text("Register"),
                            onPressed: () => model.register(),
                          ),
                          model.isBusy ? CircularProgressIndicator()
                              : Center(child: Container()),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => RegisterViewModel());
  }
}
