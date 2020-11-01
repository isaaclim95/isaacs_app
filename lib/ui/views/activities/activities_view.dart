import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/activities_view_model.dart';
import 'package:stacked/stacked.dart';

class ActivitiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ActivitiesViewModel(),
        builder: (context, model, child) =>
          PlatformScaffold(
            appBar: PlatformAppBar(

            ),
          ),
    );
  }
}
