import 'package:fluttertoast/fluttertoast.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {

  RegisterViewModel() {
    setupTextControllers();
    _navigationService.config(defaultTransition: NavigationTransition.Fade, defaultDurationTransition: Duration(seconds: 1));
  }

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String _title = "Register View";
  String get title => '$_title';

  /// Can place default credentials here
  void setupTextControllers() {
    // _emailController.text = "isaaclim95@gmail.com";
    // _passwordController.text = "password123";
  }

  Future<void> login() async  {
    if(await _authService.signIn(_emailController.text, _passwordController.text)) {
      await _navigationService.replaceWith(Routes.homeViewRoute);
    } else  {
      Fluttertoast.showToast(
          msg: "Failed to login",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  Future<void> register() async  {
    setBusy(true);
    bool registered = await _authService.signUp(emailController.text, passwordController.text);
    if(!registered)  {
      Fluttertoast.showToast(
          msg: "Failed to register",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0
      );
    } else  {
      await _navigationService.clearStackAndShow(Routes.homeViewRoute);
    }
    setBusy(false);
  }


}