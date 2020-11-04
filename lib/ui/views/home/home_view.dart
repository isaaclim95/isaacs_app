import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/ui/widgets/startup_buttonview.dart';
import 'package:stacked/stacked.dart';
import '../../models/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => PlatformScaffold(
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
                  // Grid of 4 StartupButtonView's. We pass in the title of the Page
                  // and the route
                  StartupButtonView('Activities', Routes.activitiesViewRoute),
                  StartupButtonView('Settings', Routes.settingsViewRoute),
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