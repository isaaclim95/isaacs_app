import 'package:flutter/cupertino.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:isaacs_app/ui/models/activities/email_example_viewmodel.dart';
import 'package:stacked/stacked.dart';

class EmailExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EmailExampleViewModel>.reactive(
      viewModelBuilder: () => EmailExampleViewModel(),
      builder: (context, model, child) => PlatformScaffold(
          appBar: PlatformAppBar(
            title: Text("Share example"),
          ),
          body: Container(
            child: Center(
                child: Column(
              children: [
                Text("Enter email to send to"),
                PlatformTextField(
                  controller: model.emailController,
                ),
                PlatformButton(
                  child: Text("Send email"),
                  onPressed: () => model.sendUserEmail(),
                ),
              ],
            )),
          )),
    );
  }
}
