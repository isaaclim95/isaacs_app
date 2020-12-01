import 'package:flutter/material.dart';
import 'package:isaacs_app/ui/models/activities/StorageExampleViewModel.dart';
import 'package:stacked/stacked.dart';
import 'package:webview_flutter/webview_flutter.dart';

class StorageExampleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StorageExampleViewModel>.reactive(
        builder: (context, model, child) => Scaffold(
              // body: !model.isBusy
              //     ? Container(
              //         width: 200,
              //         height: 200,
              //         child: VideoPlayer(model.controllers[0]))
              //     : CircularProgressIndicator(),
              body: Center(
                child: Container(
                  height: 500,
                  width: 500,
                  child: WebView(
                    onWebViewCreated: (WebViewController c) {
                      model.webViewcontroller = c;
                    },
                    initialUrl: 'http://192.168.1.123:8000',
                  ),
                ),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () => model.play(),
              ),
            ),
        viewModelBuilder: () => StorageExampleViewModel());
  }
}
