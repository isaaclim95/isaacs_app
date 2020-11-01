import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        builder: (context, model, child) =>
          Card(
            child: ListTile(
              title: model.name,
            ),
          ),
        viewModelBuilder: null);
  }
}
