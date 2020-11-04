import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  StartupViewModel()  {
    _navigationService.config(defaultTransition: NavigationTransition.Fade, defaultDurationTransition: Duration(seconds: 1));
  }

  bool isSignedIn = false;

  String _title = "Startup View";
  String get title => '$_title';

  Future<void> handleStartUpLogic() async {
    await Future.delayed(Duration(seconds: 1));
    var isSignedIn = _authService.isSignedIn();
    if(isSignedIn)  {
      isSignedIn = true;
      await _navigationService.replaceWithTransition(HomeView(), transition: NavigationTransition.Fade, duration: Duration(seconds: 1));
    } else  {
      await _navigationService.replaceWithTransition(LoginView(), transition: NavigationTransition.Fade, duration: Duration(seconds: 1));
    }
  }


}