import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/startup/startup_button_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// StartupButtonView builds and provides the UI for a Button that
/// navigates to a specified view
///
/// It extends StatelessWidget because we use the ViewModelBuilder to
/// react to changes, instead of using StatefulWidget and setState().
class StartupButtonView extends StatelessWidget {

  /// Local final variables which allow us to build and return our Widget ///

  // The page(Widget) we want to navigate to
  final Widget navigateToWidget;

  // Final because we don't want it to change after it's been instantiated after runtime
  final String title;

  // Constructor that allows us to pass the title in
  // If we put braces in the constructor, it makes it optional to have the arguments
  // However we need the title and the page(Widget) we want to navigate to, otherwise we will
  // get an error

  // Constructor where we pass in title and Widget we want to navigate to
  StartupButtonView(this.title, this.navigateToWidget);

  @override
  Widget build(BuildContext context) {

    // reactive makes this UI rebuild every time notifyListeners() is called.
    return ViewModelBuilder<StartupButtonViewModel>.reactive(

        // Builder provides the UI that will be "built from" the ViewModel.
        // Here we return our UI:
        builder: (context, model, child) => InkWell(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(model.title),

            // Here we declare what the button will do when it is pressed.
            // In this case, we call the StartupButtonViewModel function, navigateToPage.
            onPressed: model.navigateToPage,
          ),
        ),

        // This is the model that the UI will be "built from"
        // We pass in the title and Widget we want to navigate to.
        viewModelBuilder: () => StartupButtonViewModel(title, navigateToWidget));
  }
}