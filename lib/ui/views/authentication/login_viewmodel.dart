import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = "Login View";
  String get title => '$_title';

  Future login() async  {
    await _authService.signIn();
    print("logged in");
    _navigationService.navigateToView(HomeView());
  }

}