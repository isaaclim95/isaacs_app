import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  bool isLoading = true;
  bool isSignedIn = false;

  String _title = "Startup View";
  String get title => '$_title';


  Future handleStartUpLogic() async {
    print("finished startupLogic");
    var isSignedIn = await _authService.isSignedIn();
    if(isSignedIn)  {
      isSignedIn = true;
      _navigationService.replaceWith('home');
    } else  {
      _navigationService.replaceWith('login');
    }
    isLoading = false;
    notifyListeners();
    print("finished startupLogic");
  }


}