import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';

class SharingViewModel extends BaseViewModel  {

  final TextEditingController _sharingController = new TextEditingController();

  void share(text) {
    Share.share(text);
  }

  TextEditingController get sharingController => _sharingController;

}