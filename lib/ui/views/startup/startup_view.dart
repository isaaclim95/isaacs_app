import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/authentication/login_view.dart';
import 'package:isaacs_app/ui/views/home/home_view.dart';
import 'package:isaacs_app/ui/views/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) => model.handleStartUpLogic(),
      fireOnModelReadyOnce: true,
      builder: (context, model, child) => !model.isLoading
        ? model.isSignedIn
          ? HomeView()
          : LoginView()
        : Scaffold(
          body: Container(
            constraints: BoxConstraints.expand(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Loading..."),
                SizedBox(height: 10),
                CircularProgressIndicator(),
              ],
            ),
          )
      ),

      viewModelBuilder: () => StartupViewModel(),

    );
  }
  
}