import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class DynamicListViewModel extends BaseViewModel {

  /// Constructor
  DynamicListViewModel() {

    // Adds the initial tile into the page
    addTile();

  }


  // List of tiles
  List<CupertinoTextField> tiles = [];

  List<TextEditingController> controllers = [];

  List<String> get emails  {
    List<String> _emails = [];
    for(int i = 0; i < tiles.length; i++) {
      _emails.add(controllers[i].text);
    }
    return _emails;
  }

  void addTile()  {
    TextEditingController controller = TextEditingController();
    controllers.add(controller);
    tiles.add(tile(controller));
    notifyListeners();
  }

  CupertinoTextField tile(controller) {
    return CupertinoTextField(
      controller: controller,
      padding: EdgeInsets.all(10.0),
      placeholder: "mail@example.com",
    );
  }

}