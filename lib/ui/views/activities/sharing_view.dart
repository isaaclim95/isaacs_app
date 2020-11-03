import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/activities/sharing_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SharingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SharingViewModel>.nonReactive(
        builder: (context, model, child) =>
          PlatformScaffold(
            appBar: PlatformAppBar(),
            body: Container(
              child: Column(
                children: [
                  PlatformButton(
                    child: Text("Share"),
                    onPressed: () {
                      // Share.share('check out my website');
                      model.sendInvite();
                    },
                  ),
                ],
              ),
            ),
          ),
        viewModelBuilder: () => SharingViewModel());
  }
}
