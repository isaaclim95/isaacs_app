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
    String errorMsg;
    String contentMsg = "Please try again.";
    setBusy(true);
    try {
      await _authService.signIn(_emailController.text, _passwordController.text);
      await _navigationService.replaceWith(Routes.homeViewRoute);
    } catch (error) {
      print(error.code);
      switch (error.code) {
        case "wrong-password":
          errorMsg = "The password is incorrect.";
          break;
        case "invalid-email":
          errorMsg = "The email address is incorrect.";
          break;
        case "user-not-found":
          errorMsg = "Email not found.";
          break;
        case "unknown":
          errorMsg = "Enter a valid email and password.";
          break;
        case "too-many-requests":
          errorMsg = "Too many login attempts.";
          contentMsg = "Please try again later.";
          break;
        default:
          errorMsg = "Something went wrong";
      }
      print(error.toString());

    }
    showIncorrectCredentialsDialog(context, errorMsg, contentMsg);
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

  Future<void> showIncorrectCredentialsDialog(BuildContext context, String title, content) {
    return showCupertinoDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
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