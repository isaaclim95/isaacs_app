import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:isaacs_app/app/locator.dart';

class SharingViewModel extends BaseViewModel  {

  final AuthService _authService = locator<AuthService>();

  void sendInvite() {
    print("Send invite here");
  }

}