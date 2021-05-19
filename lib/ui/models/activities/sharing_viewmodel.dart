import 'package:cron_parser/cron_parser.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:stacked/stacked.dart';

class SharingViewModel extends BaseViewModel {
  final TextEditingController _sharingController = new TextEditingController();

  void share() {
    Share.share(_sharingController.text);
  }

  TextEditingController get sharingController => _sharingController;

  void test() {
    var cron = Cron().parse("30 5 * * 3", "Australia/Brisbane");
    print(cron.next());
  }
}
