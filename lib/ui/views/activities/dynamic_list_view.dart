import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:isaacs_app/ui/models/dynamic_list_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DynamicListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DynamicListViewModel>.reactive(
      builder: (context, model, child) => PlatformScaffold(
        appBar: PlatformAppBar(
          title: Text("Dynamic list example"),
        ),
        body: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              itemCount: model.tiles.length,
              itemBuilder: (BuildContext context, int index) {
                return model.tiles[index];
              },
            ),
            PlatformButton(
              child: Text("Add tile"),
              onPressed: () {
                model.addTile();
              },
            ),
            PlatformButton(
              child: Text("Show text's"),
              onPressed: () {
                Fluttertoast.showToast(
                    msg: model.emails.toString(),
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    backgroundColor: Colors.grey,
                    textColor: Colors.white,
                    fontSize: 16.0
                );
              },
            )
          ],
        ),
      ),
      viewModelBuilder: () => DynamicListViewModel(),
    );
  }
}