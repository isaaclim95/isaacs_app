import 'package:fluttertoast/fluttertoast.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/services/firebase_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {

  RegisterViewModel() {
    setupTextControllers();
    _navigationService.config(defaultTransition: NavigationTransition.Fade, defaultDurationTransition: Duration(seconds: 1));
  }

  final FirebaseService _firebaseService = locator<FirebaseService>();
  final NavigationService _navigationService = locator<NavigationService>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String _title = "Register View";
  String get title => '$_title';
  bool _obscure = true;

  /// Can place default credentials here
  void setupTextControllers() {
    // _emailController.text = "isaaclim95@gmail.com";
    // _passwordController.text = "password123";
  }

  bool get obscureText => _obscure;

  void obscure () {
    _obscure = !_obscure;
    notifyListeners();
  }

  Future<void> register() async  {
    setBusy(true);
    bool registered = await _firebaseService.register(emailController.text, passwordController.text);
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