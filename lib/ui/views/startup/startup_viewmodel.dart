import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  String _title = "Startup View";

  String get title => '$_title';

  void navigateToPage() {
    _navigationService.navigateToView(ProfileView());



  }
}