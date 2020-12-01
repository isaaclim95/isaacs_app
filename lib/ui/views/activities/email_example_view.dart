import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
            body: Stack(
              children: [
                Container(
                  child: Center(
                      child: Column(
                    children: [
                      Text("Email"),
                      PlatformTextField(
                        controller: model.emailController,
                      ),
                      SizedBox(height: 20),
                      Text("Subject"),
                      PlatformTextField(
                        controller: model.subjectController,
                      ),
                      SizedBox(height: 20),
                      Text("Body"),
                      PlatformTextField(
                        controller: model.bodyController,
                      ),
                      PlatformButton(
                        child: Text("Send email"),
                        onPressed: () {
                          model.sendUserEmail();
                          FocusScope.of(context).requestFocus(FocusNode());
                        },
                      ),
                    ],
                  )),
                ),
                Center(
                  child:
                      !model.isBusy ? Container() : CircularProgressIndicator(),
                )
              ],
            )));
  }
}
