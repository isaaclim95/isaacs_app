import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SettingsViewModel extends BaseViewModel {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  SettingsViewModel() {
    _navigationService.config(defaultTransition: NavigationTransition.Fade, defaultDurationTransition: Duration(seconds: 1));
  }

  Future<void> signOut() async  {

    if(await _authService.signOut())  {

      await _navigationService.clearStackAndShow(Routes.loginViewRoute);

    }

  }

}