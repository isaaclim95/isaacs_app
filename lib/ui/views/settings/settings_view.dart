import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/settings/settings_viewmodel.dart';
import 'package:isaacs_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      viewModelBuilder: () => SettingsViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RaisedButton(
                  child: Text("Sign out"),
                  onPressed: () => model.signOut(),

                ),
              ],
            ),
          )
      ),

    );
  }

}