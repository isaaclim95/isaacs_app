import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text(model.title),
        ),
        body: model.dataReady
            ? ListView.builder(
            itemCount: model.users.length,
            itemBuilder: (context, index) {
              var user = model.users[index];
              return Material(  // Wrapped in Material so we can use the ListTile widget in ios
                child: ListTile(
                  title: Text(
                    user.name + " " + user.age.toString() + " " + user.weight.toString()
                        + " " + user.height.toString()
                  ),
                ),
              );
            })
            : Center(child: CircularProgressIndicator())),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }

}