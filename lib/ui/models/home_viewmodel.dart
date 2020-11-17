import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  String _title = "Home View";
  String get title => '$_title';

  void onSettingsTap(context) {
    _navigationService.navigateTo(Routes.settingsViewRoute);
  }
}
