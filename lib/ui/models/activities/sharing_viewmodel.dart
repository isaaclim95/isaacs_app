import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';

class SharingViewModel extends BaseViewModel {
  final TextEditingController _sharingController = new TextEditingController();

  void share() {
    Share.share(_sharingController.text);
  }

  TextEditingController get sharingController => _sharingController;
}
