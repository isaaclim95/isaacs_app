
  }

  String _title = "Dynamic List View";


  // List of tiles
  List<CupertinoTextField> tiles = [];

  List<TextEditingController> controllers = [];

  String get title => '$_title';

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