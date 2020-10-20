import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/startup/startup_button_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupButtonView extends StatelessWidget {

  // Has to be final
  final String title;

  // Constructor that allows us to pass the title in
  const StartupButtonView ({ Key key, this.title }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupButtonViewModel>.reactive(
        builder: (context, model, child) => InkWell(
          child: RaisedButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(title),
            onPressed: () {
              model.navigateToPage();
            },
          ),
        ),
        viewModelBuilder: () => StartupButtonViewModel());
  }
}
