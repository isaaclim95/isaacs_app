import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {

  LoginViewModel() {
    setupTextControllers();
  }

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String _title = "Login View";
  String get title => '$_title';

  void setupTextControllers() {
    _emailController.text = "isaaclim95@gmail.com";
    _passwordController.text = "password123";
  }

  Future<void> login() async  {
    if(await _authService.signIn(_emailController.text, _passwordController.text)) {
      _navigationService.replaceWith('home');
    } else  {
      print("Failed to login.");
    }
  }

}