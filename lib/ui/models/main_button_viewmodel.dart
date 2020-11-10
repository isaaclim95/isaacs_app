import 'package:isaacs_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


/// StartupButtonViewModel is the model which StartupButtonView is based on.
/// We create this class to separate the logic and UI components of our Button.
class MainButtonViewModel extends BaseViewModel {

  // This is the instance of NavigationService for which we only have one
  // due to the locator instance.
  // We use this service to navigate to a view using the included navigateToView().
  final NavigationService _navigationService = locator<NavigationService>();

  // The page(Widget) we want to navigate to
  final String _routeName;

  String _title;

  String get title => _title;

  // Constructor that allows us to pass the title in
  MainButtonViewModel(this._title, this._routeName)  {
    _title = this._title;
  }

  // navigateToPage() just calls navigateToView using our page (Widget) we want to
  // navigate to.
  // Call this function from the StartupButtonView
  Future<void> navigateTo() async{

    await _navigationService.navigateTo(_routeName);

  }

}