import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/models/activities/streams_example2_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StreamsExample2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamsExample2ViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: Text('Streams 2'),
              ),
              body: Center(
                child: Column(children: [
                  model.dataReady
                      ? ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.convos.length,
                          itemBuilder: (context, index) =>
                              Text(model.convos[index]))
                      : CircularProgressIndicator(),
                  Container(
                    width: 200,
                    height: 200,
                    child: RaisedButton(
                      onPressed: () => model.f(),
                    ),
                  ),
                ]),
              ),
            ),
        viewModelBuilder: () => StreamsExample2ViewModel());
  }
}
