import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupButtonViewModel extends BaseViewModel {

  int index = 0;
  final NavigationService _navigationService = locator<NavigationService>();


  void printSomething() {
    print("hi");
  }

  void navigateToPage() {
    if (index == 0) {
      _navigationService.navigateToView(ProfileView());
      index++;
    }
    // } else if(index == 1) {
    //   _navigationService.navigateToView(RecordView());
    // } else if(index == 2) {
    //   _navigationService.navigateToView(StatsView());
    // } else if(index == 3) {
    //   _navigationService.navigateToView(SettingsView());
    // }


  }

}