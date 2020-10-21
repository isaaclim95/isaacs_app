import 'package:flutter/material.dart';
import 'package:isaacs_app/app/locator.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupButtonViewModel extends BaseViewModel {

  final Widget navigateToWidget;
  // Has to be final
  final String title;

  // Constructor that allows us to pass the title in
  StartupButtonViewModel({this.title, this.navigateToWidget});


  final NavigationService _navigationService = locator<NavigationService>();



  void navigateToPage() {

      _navigationService.navigateToView(navigateToWidget);

  }

}