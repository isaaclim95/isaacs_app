import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseViewModel {

  final BuildContext context;

  LoginViewModel(this.context);

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String _title = "Login View";
  String get title => '$_title';
  bool _obscure = true;

  Future<void> login() async  {
    setBusy(true);
    try {
      await _authService.signIn(_emailController.text, _passwordController.text);
      await _navigationService.replaceWith(Routes.homeViewRoute);
    } catch (exception) {
      showIncorrectCredentialsDialog(context);
      print("Failed to login: " + exception.toString());
    }
    setBusy(false);
  }

  bool get obscureText => _obscure;

  void obscure () {
    _obscure = !_obscure;
    notifyListeners();
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