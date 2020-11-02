import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/ui/models/register_viewmodel.dart';
import 'package:stacked/stacked.dart';

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
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: PlatformTextField(
                              controller: model.emailController,
                              obscureText: false,
                              // decoration: InputDecoration(
                              //   border: OutlineInputBorder(),
                              //   labelText: 'Email',
                              // ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10.0),
                            child: PlatformTextField(
                              controller: model.passwordController,
                              obscureText: true,
                              // decoration: InputDecoration(
                              //   border: OutlineInputBorder(),
                              //   labelText: 'Password',
                              // ),
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
