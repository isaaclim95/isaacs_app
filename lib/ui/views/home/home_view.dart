import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/streamcounter/streamcounter_view.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:isaacs_app/ui/views/record/record_view.dart';
import 'package:isaacs_app/ui/views/settings/settings_view.dart';
import 'package:isaacs_app/ui/views/startup/startup_buttonview.dart';
import 'package:stacked/stacked.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20.0),
              child: GridView.count(
                shrinkWrap: true,       // Allow it to sit in a column without giving an error
                primary: false,         // Non-scrollable
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  StartupButtonView("Profile", ProfileView()),
                  StartupButtonView("Record", RecordView()),
                  StartupButtonView("Streams", StreamCounterView()),
                  StartupButtonView("Settings", SettingsView()),
                ],
              ),
            )

          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),

    );
  }

}