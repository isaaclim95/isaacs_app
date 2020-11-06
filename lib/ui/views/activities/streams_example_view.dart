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
            title: Text("Streams"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 20),
                Text('Here is an example of using streams. We build a listview '
                    'using ListView.builder, and listen for changes in the database.'),
                SizedBox(height: 20),
                Table(
                  children: [
                    TableRow(children: [
                      TableCell(child: Text('Name')),
                      TableCell(child: Text('Age')),
                      TableCell(
                          child: Text('Weight')),
                      TableCell(
                          child: Text('Height')),
                      TableCell(
                          child: Text('Active')),
                    ])
                  ],
                ),
                model.dataReady
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: model.users.length,
                        itemBuilder: (context, index) {
                          var user = model.users[index];
                          return Material(
                            // Wrapped in Material so we can use the ListTile widget in ios
                            child: Table(
                              children: [
                                TableRow(children: [
                                  TableCell(child: Text(user.name)),
                                  TableCell(child: Text(user.age.toString())),
                                  TableCell(
                                      child: Text(user.weight.toString())),
                                  TableCell(
                                      child: Text(user.height.toString())),
                                  TableCell(
                                      child: Text(user.isOnline.toString())),
                                ])
                              ],
                            ),
                          );
                        })
                    : Center(child: CircularProgressIndicator()),
              ],
            ),
          )),
      viewModelBuilder: () => StreamsExampleViewModel(),
    );
  }
}
