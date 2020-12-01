import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewDrawerViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void settings() {
    _navigationService.navigateTo(Routes.settingsViewRoute);
  }
}
