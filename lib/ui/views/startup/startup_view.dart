import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/profile/profile_view.dart';
import 'package:isaacs_app/ui/views/record/record_view.dart';
import 'package:isaacs_app/ui/views/startup/startup_buttonview.dart';
import 'package:isaacs_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
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
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  StartupButtonView("Profile", ProfileView()),
                  StartupButtonView("Record", RecordView()),
                  StartupButtonView("Stats", ProfileView()),
                  StartupButtonView("Settings", ProfileView()),
                ],
              ),
            )

          ],
        ),
      ),
      viewModelBuilder: () => StartupViewModel(),

    );
  }
  
}