import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:isaacs_app/ui/models/activities/streams_example_viewmodel.dart';

class StreamsExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamsExampleViewModel>.reactive(
      builder: (context, model, child) => PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text("Here we build a listview using"),
          ),
          body: Column(
            children: [
              Text("Users"),
              model.dataReady
                  ? ListView.builder(
                  shrinkWrap: true,
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
                  : Center(child: CircularProgressIndicator()),
            ],
          )),
      viewModelBuilder: () => StreamsExampleViewModel(),
    );
  }

}