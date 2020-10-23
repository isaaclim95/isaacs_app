import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: model.dataReady
            ? ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              var user = model.users[index];
              print(user);
              return Card(
                child: Text(
                  "Isaac"
                ),
              );
            })
            : Center(child: CircularProgressIndicator())),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

}