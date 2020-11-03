import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {

  BuildContext context;

  LoginViewModel(this.context) {
    setupTextControllers();
    _navigationService.config(defaultTransition: NavigationTransition.Fade, defaultDurationTransition: Duration(seconds: 1));
  }

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String _title = "Login View";
  String get title => '$_title';
  bool incorrectCredentials = false;

  /// Can place default credentials here
  void setupTextControllers() {
    // _emailController.text = "isaaclim95@gmail.com";
    // _passwordController.text = "password123";
  }

  Future<void> login() async  {
    setBusy(true);
    try {
      if(await _authService.signIn(_emailController.text, _passwordController.text))  {
      } else  {
      }
      await _navigationService.replaceWith(Routes.homeViewRoute);
    } catch (exception) {
      incorrectCredentials = true;
      showIncorrectCredentialsDialog(context);
      print("Failed to login: " + exception.toString());
    }
    setBusy(false);
  }

  Future<void> goToRegisterView() async {
    _navigationService.navigateTo(Routes.registerViewRoute);
  }

  Future<void> showIncorrectCredentialsDialog(BuildContext context) {
    return showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Incorrect email or password'),
          content: Text('Please try again.'),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text('Ok'),
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