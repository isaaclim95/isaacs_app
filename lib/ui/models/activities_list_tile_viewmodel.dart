import 'package:isaacs_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ActivitiesListTileViewModel extends BaseViewModel {

  final NavigationService _navigationService = locator<NavigationService>();

  String _routeName;

  ActivitiesListTileViewModel(this._routeName);

  Future<void> navigateToActivity() async {
    await _navigationService.navigateTo(_routeName);
  }
}