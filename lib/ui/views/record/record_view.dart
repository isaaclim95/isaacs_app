import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/views/record/record_viewmodel.dart';
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
            Text(model.title),

          ],
        ),
      ),
      viewModelBuilder: () => RecordViewModel(),

    );
  }

}