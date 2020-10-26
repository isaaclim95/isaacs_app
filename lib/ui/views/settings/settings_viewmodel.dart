import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  void signOut() async  {
    if(await _authService.signOut())  {
      _navigationService.clearStackAndShow('login');
    }
  }


}