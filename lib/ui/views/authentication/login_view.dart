import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/login_viewmodel.dart';
import 'package:stacked/stacked.dart';


class LoginView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 150,
                        child: PlatformButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.grey[100],
                          child: Text("Login", style: TextStyle(color: Colors.blue)),
                          onPressed: model.login,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SizedBox(
                        width: 150,
                        child: PlatformButton(
                          padding: EdgeInsets.all(0.0),
                          color: Colors.grey[100],
                          child: Text("Register", style: TextStyle(color: Colors.blue)),
                          onPressed: () => model.goToRegisterView(),
                        ),
                      ),
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
    );
  }
}
