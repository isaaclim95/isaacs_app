import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/models/widgets/home_view_drawer_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeViewDrawerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewDrawerViewModel>.nonReactive(
        builder: (context, model, child) => SafeArea(
              child: Drawer(
                child: LayoutBuilder(
                  builder: (context, constraint) {
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints:
                            BoxConstraints(minHeight: constraint.maxHeight),
                        child: IntrinsicHeight(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              SizedBox(
                                height: 70,
                                width: double.infinity,
                                child: DrawerHeader(
                                  child: Text('Isaac\'s App'),
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.home),
                                title: Text("Home"),
                                onTap: () {},
                              ),
                              new ListTile(
                                title: new Text(
                                  'Jobs',
                                  style: TextStyle(color: Colors.black54),
                                ),
                                dense: true,
                              ),
                              ListTile(
                                leading: Icon(Icons.location_on),
                                title: Text("Nearby"),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.check_circle_outline),
                                title: Text("Applied"),
                                onTap: () {},
                              ),
                              ListTile(
                                leading: Icon(Icons.check_circle),
                                title: Text("Hired"),
                                onTap: () {},
                              ),
                              const Expanded(child: SizedBox()),
                              const Divider(height: 1.0, color: Colors.grey),
                              ListTile(
                                leading: Icon(Icons.settings),
                                title: Text("Settings"),
                                onTap: () {
                                  model.settings();
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
        viewModelBuilder: () => HomeViewDrawerViewModel());
  }
}
