import 'package:flutter/material.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/ui/widgets/home_view_drawer_view.dart';
import 'package:isaacs_app/ui/widgets/main_buttonview.dart';
import 'package:stacked/stacked.dart';

import '../../models/home_viewmodel.dart';

/// HomeView
class HomeView extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
        ),
        drawer: HomeViewDrawerView(),
        body: Column(
          children: [
            Stack(children: [
              Container(
                height: size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25))),
              ),
              Center(
                child: Text(
                  'Home',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ]),
            Container(
              padding: EdgeInsets.all(20.0),
              child: GridView.count(
                shrinkWrap:
                    true, // Allow it to sit in a column without giving an error
                primary: false, // Non-scrollable
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 30,
                children: [
                  // Grid of 4 StartupButtonView's. We pass in the title of the Page
                  // and the route
                  MainButtonView('Activities', Routes.activitiesViewRoute),
                  MainButtonView('Settings', Routes.settingsViewRoute),
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
