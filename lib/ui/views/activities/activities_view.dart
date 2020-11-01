import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/app/router.gr.dart';
import 'package:isaacs_app/ui/models/activities_view_model.dart';
import 'package:isaacs_app/ui/widgets/activities_list_tile_view.dart';
import 'package:stacked/stacked.dart';

class ActivitiesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.nonReactive(
        viewModelBuilder: () => ActivitiesViewModel(),
        builder: (context, model, child) =>
          PlatformScaffold(
            appBar: PlatformAppBar(
              title: Text("Activities")
            ),
            body: ListView(
              children: [
                /// New activities go here
                ActivitiesListTileView('Dynamic List', Routes.dynamicListViewRoute),
                ActivitiesListTileView('Dynamic List', Routes.sharingViewRoute),

              ],
            ),

          ),
    );
  }
}
