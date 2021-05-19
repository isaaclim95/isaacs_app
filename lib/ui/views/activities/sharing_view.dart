import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/activities/sharing_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SharingView extends StatelessWidget {
  SharingView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SharingViewModel>.nonReactive(
        builder: (context, model, child) => PlatformScaffold(
              appBar: PlatformAppBar(
                title: Text("Share example"),
              ),
              body: Container(
                child: Center(
                  child: Column(
                    children: [
                      Flexible(
                        child: FractionallySizedBox(
                          widthFactor: 0.5,
                          heightFactor: 0.5,
                          child: PlatformTextField(
                            controller: model.sharingController,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      PlatformButton(
                        child: Text("Share"),
                        onPressed: () {
                          model.share();
                        },
                      ),
                      PlatformButton(
                        child: Text("Test"),
                        onPressed: () {
                          model.test();
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
        viewModelBuilder: () => SharingViewModel());
  }
}
