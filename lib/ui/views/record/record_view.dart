import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/profile/profile_viewmodel.dart';
import 'package:isaacs_app/ui/views/startup/startup_button.dart';
import 'package:stacked/stacked.dart';

class RecordView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecordViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Column(
          children: [
            Text("record"),

          ],
        ),
      ),
      viewModelBuilder: () => RecordViewModel(),

    );
  }

}