import 'package:flutter/material.dart';
import 'package:isaacs_app/app/router.gr.dart';
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
        drawer: Drawer(
          child: Column(
            children: [
              Expanded(
                  child: ListView(
                children: [
                  DrawerHeader(
                    child: Text('Isaac\'s App'),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                  ),
                  ListTile(
                    title: Text('Item 1'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Item 2'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    title: Text('Item 3'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              )),
              Container(
                  // This align moves the children to the bottom
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                          child: Column(
                        children: <Widget>[
                          Divider(),
                          GestureDetector(
                            onTap: () {
                              model.onSettingsTap(context);
                            },
                            child: ListTile(
                                leading: Icon(Icons.settings),
                                title: Text('Settings')),
                          ),
                          ListTile(
                              leading: Icon(Icons.help),
                              title: Text('Help and Feedback'))
                        ],
                      ))))
            ],
          ),
        ),
        appBar: AppBar(
          // leading: Icon(Icons.menu),
          elevation: 0,
        ),
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
