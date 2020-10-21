import 'package:flutter/material.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';


/// StartupButtonViewModel is the model which StartupButtonView is based on.
/// We create this class to separate the logic and UI components of our Button.
class StartupButtonViewModel extends BaseViewModel {

  // This is the instance of NavigationService for which we only have one
  // due to the locator instance.
  // We use this service to navigate to a view using the included navigateToView().
  final NavigationService _navigationService = locator<NavigationService>();

  // The page(Widget) we want to navigate to
  final Widget navigateToWidget;

  // Final because we don't want it to change after it's been instantiated after runtime
  final String title;

  // Constructor that allows us to pass the title in
  StartupButtonViewModel(this.title, this.navigateToWidget);

  // navigateToPage() just calls navigateToView using our page (Widget) we want to
  // navigate to.
  // Call this function from the StartupButtonView
  // We set the return type to "Future" because navigateToView returns a value of "Dynamic"
  // in the "Future".
  Future navigateToPage() {

    return _navigationService.navigateToView(navigateToWidget);

  }

}