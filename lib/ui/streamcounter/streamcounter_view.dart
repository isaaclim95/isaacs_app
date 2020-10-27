import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/streamcounter/streamcounter_viewmodel.dart';
import 'package:stacked/stacked.dart';

// View
class StreamCounterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StreamCounterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: Text(model.title),
        ),
        body: Center(
          child: Text(model.timeData),
        ),
      ),
      viewModelBuilder: () => StreamCounterViewModel(),
    );
  }
}