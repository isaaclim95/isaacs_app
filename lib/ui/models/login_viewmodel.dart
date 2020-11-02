import 'package:flutter/cupertino.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {

  LoginViewModel() {
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

  void setupTextControllers() {
    // _emailController.text = "isaaclim95@gmail.com";
    // _passwordController.text = "password123";
  }

  Future<void> login() async  {
    setBusy(true);
    if(await _authService.signIn(_emailController.text, _passwordController.text)) {
      await _navigationService.replaceWith(Routes.homeViewRoute);
    } else  {
      // TODO: Put toast here
      print("Failed to login.");
    }
    setBusy(false);
  }

  Future<void> goToRegisterView() async {
    _navigationService.navigateTo(Routes.registerViewRoute);
  }

}