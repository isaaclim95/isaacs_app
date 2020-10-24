import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/services/authentication_service.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends StreamViewModel<bool> {

  final AuthService _authService = locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();
  bool isLoading = true;
  bool isSignedIn = false;

  String _title = "Startup View";
  String get title => '$_title';


  Future handleStartUpLogic() async {
    var isSignedIn = await _authService.isSignedIn();
    if(isSignedIn)  {
      isSignedIn = true;
      _navigationService.navigateToView(HomeView());
    } else  {
      _navigationService.navigateToView(LoginView());
    }
    isLoading = false;
    notifyListeners();
    print("finished startupLogic");
  }

  @override
  // TODO: implement stream
  Stream<bool> get stream => throw UnimplementedError();



}