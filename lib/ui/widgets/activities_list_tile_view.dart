import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/activities_list_tile_viewmodel.dart';
import 'package:stacked/stacked.dart';

/// ActivitiesListTileView is a custom tile widget for Activities view.
/// So far it just absorbs the parent's dimensions
class ActivitiesListTileView extends StatelessWidget {
  
  final String title;
  final String routeName;


  ActivitiesListTileView(this.title, this.routeName);
  
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ActivitiesListTileViewModel>.reactive(
        builder: (context, model, child) =>
          PlatformButton(
            child: Text(title),
            onPressed: model.navigateToActivity,
          ),
        viewModelBuilder: () => ActivitiesListTileViewModel(routeName),
    );
  }
}
