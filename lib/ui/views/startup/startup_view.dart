import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/startup/startup_button.dart';
import 'package:isaacs_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

// TODO: Implement different views for different StartupButtonView's that are created
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
                  StartupButtonView(title:"Profile",),
                  StartupButtonView(title:"Record"),
                  StartupButtonView(title:"Stats"),
                  StartupButtonView(title:"Settings"),
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